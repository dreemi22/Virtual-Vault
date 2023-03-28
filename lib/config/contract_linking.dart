import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class ContractLinking {
  bool isLoading = true;
  final String _rpcUrl = "HTTP://192.168.188.141:7545";
  final String _privateKey =
      "ad069960cdbbc06b58942b921e83d94f9e60982153f8a91a6157e423c449e75a";
  Credentials? _credentials;
  Web3Client? _client;
  String? _abiCode;
  EthereumAddress? _contractAddress;
  DeployedContract? _contract;
  ContractFunction? regiserUser;
  ContractFunction? getUser;

  ContractLinking() {
    initiateSetup();
  }

  Future<void> initiateSetup() async {
    _client = Web3Client(_rpcUrl, Client());
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle.loadString("src/abis/User.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi['abi']);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi['networks']["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = EthPrivateKey.fromHex(_privateKey);
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "User"), _contractAddress!);
    regiserUser = _contract!.function("userCids");
    getUser = _contract!.function("getUserCids");
  }

  getUserData(EthereumAddress address) async {
    List totalUserList = await _client!
        .call(contract: _contract!, function: getUser!, params: [address]);
    BigInt totalUsers = totalUserList[0];
    if (kDebugMode) {
      print("TotalUsers: $totalUsers");
    }

    isLoading = false;
  }

  registerUser(String cid) async {
    print("register Function entered");
    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!, function: regiserUser!, parameters: [cid]));
    print("User Registered");
  }
}
