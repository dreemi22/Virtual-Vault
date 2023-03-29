import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class ContractLinking {
  bool isLoading = true;
  final String _privateKey =
      "0dc265cf367353087fd576e4bb267ff43f66fa45389a7e8f61caf6a6ce0fabe3";
  Credentials? credentials;
  final Web3Client client = Web3Client("HTTP://192.168.188.141:7545", Client());
  String? abiCode;
  EthereumAddress? contractAddress;
  DeployedContract? contract;
  ContractFunction? regUser;
  ContractFunction? getUser;

  ContractLinking() {
    initiateSetup();
  }
  initiateSetup() async {
    await getAbi();
    getCredentials();
    getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle.loadString("src/abis/User.json");
    final jsonAbi = jsonDecode(abiStringFile);
    abiCode = jsonEncode(jsonAbi['abi']);
    contractAddress =
        EthereumAddress.fromHex(jsonAbi['networks']["5777"]["address"]);
  }

  void getCredentials() {
    credentials = EthPrivateKey.fromHex(_privateKey);
  }

  void getDeployedContract() {
    print(abiCode);
    contract = DeployedContract(
        ContractAbi.fromJson(abiCode!, "User"), contractAddress!);
    regUser = contract!.function("userCids");
    getUser = contract!.function("getUserCids");
  }

  getUserData(EthereumAddress address) async {
    List totalUserList = await client!
        .call(contract: contract!, function: getUser!, params: [address]);
    var totalUsers = totalUserList[0];
    if (kDebugMode) {
      print("TotalUsers: $totalUsers");
    }

    isLoading = false;
  }

  registerUser(String cid) async {
    print("Contract Address :");
    print(contractAddress);
    await client.sendTransaction(
        credentials!,
        Transaction.callContract(
            contract: contract!, function: regUser!, parameters: [cid]));
    print("User Registered");
    print(cid);
    getUserData(EthereumAddress.fromHex("0x951588824AdAa88DAd1eB69CA7F53B931D9214ed"));
  }
}
