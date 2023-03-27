import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class WalletProvider {
  final Web3Client _web3client = Web3Client("HTTP://192.168.112.141:7545", Client());
  EthereumAddress? ethereumAddress;
  EtherAmount? etherAmount;
  Credentials? _credentials;
  double accountBalance = 0;

  initializeFromKey(String privateKey) {
    try {
      _credentials = EthPrivateKey.fromHex(privateKey);
      ethereumAddress = _credentials!.address;
      getBalance();
    } on FormatException catch (e) {
      debugPrint('Error: ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  getBalance() async {
    etherAmount = await _web3client
        .getBalance(EthereumAddress.fromHex(ethereumAddress!.hex));
    accountBalance = etherAmount!.getInEther.toDouble();
    print("Account Balance: $accountBalance");
  }
}
