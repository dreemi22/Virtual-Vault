import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class TodoListModel {
  bool isLoading = true;
  final String _rpcUrl = "HTTP://192.168.43.59:7545";
  final String _privateKey =
      "c8853e9154746601bba62042511016feca202deaac416da7f05493950638c0b7";
  Credentials? _credentials;
  Web3Client? _client;
  String? _abiCode;
  EthereumAddress? _contractAddress;
  DeployedContract? _contract;
  ContractFunction? regiserUser;
  ContractFunction? getUser;

  TodoListModel() {
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
        ContractAbi.fromJson(_abiCode!, "UserData"), _contractAddress!);
    regiserUser = _contract!.function("registerUser");
    getUser = _contract!.function("getUser");
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

  registerUser(String name, UintType number) async {
    isLoading = true;

    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: regiserUser!,
            parameters: [number, name, []]));
  }
}

// class User {
//   final UintType number;
//   final String? name;
//   final List<String> cids;
//   User({required this.number, this.name, required this.cids});
// }
