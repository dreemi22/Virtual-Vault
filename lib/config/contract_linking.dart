import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:virtualvault/config/walletservice.dart';
import 'package:web3dart/web3dart.dart';

class ContractLinking {
  bool isLoading = true;
  String privateKey = "";
  Credentials? credentials;
  final Web3Client client = Web3Client("HTTP://192.168.188.141:7545", Client());
  String? abiCode;
  EthereumAddress? contractAddress;
  DeployedContract? contract;
  ContractFunction? regUser;
  ContractFunction? getUser;
  WalletService walletService = WalletService();

  ContractLinking() {
    initiateSetup();
  }
  initiateSetup() async {
    await getData();
    await getAbi();
    getCredentials();
    getDeployedContract();
  }

  getData() async {
    privateKey = await walletService.getPrivateKey();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle.loadString("src/abis/User.json");
    final jsonAbi = jsonDecode(abiStringFile);
    abiCode = jsonEncode(jsonAbi['abi']);
    contractAddress =
        EthereumAddress.fromHex(jsonAbi['networks']["5777"]["address"]);
  }

  void getCredentials() {
    credentials = EthPrivateKey.fromHex(privateKey);
  }

  void getDeployedContract() {
    contract = DeployedContract(
        ContractAbi.fromJson(abiCode!, "User"), contractAddress!);
    regUser = contract!.function("userCids");
    getUser = contract!.function("getUserCids");
  }

  Future<List> getUserData(EthereumAddress address) async {
    List totalUserList = await client
        .call(contract: contract!, function: getUser!, params: [address]);
    var totalUsers = totalUserList[0];
    if (kDebugMode) {
      print("TotalUsers: $totalUsers");
    }
    isLoading = false;
    return totalUsers;
  }

  registerUser(String cid) async {
    await client.sendTransaction(
        credentials!,
        Transaction.callContract(
            contract: contract!, function: regUser!, parameters: [cid]));
    print(cid);
    print("User Registered");
  }
}
