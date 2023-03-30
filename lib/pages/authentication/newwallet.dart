import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:virtualvault/config/walletprovider.dart';
import 'package:virtualvault/pages/home.dart';
import 'package:virtualvault/widgets/custom_buttons.dart';
import 'package:web3dart/web3dart.dart';

class NewWallet extends StatefulWidget {
  const NewWallet({super.key});

  @override
  State<NewWallet> createState() => NewWalletState();
}

class NewWalletState extends State<NewWallet> {
  WalletProvider walletProvider = WalletProvider();
  @override
  void initState() {
    super.initState();
    walletProvider.createWallet();
    walletFun();
  }

  void getBalance() async {}
  double amount = 0;
  walletFun() async {
    EtherAmount etherAmount =
        await Web3Client("HTTP://192.168.43.59:7545", Client()).getBalance(
            EthereumAddress.fromHex(walletProvider.ethereumAddress!.hex));

    setState(() {
      amount = etherAmount.getInEther.toDouble();
      print("Account bal: $amount");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250,
                child: LottieBuilder.asset('images/successfully-done.json')),
            const Text('Congratulations',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('Account created',
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 20,
                )),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Public address',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 20,
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(walletProvider.ethereumAddress.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text: walletProvider.ethereumAddress.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Copied to clipboard'),
                      ));
                    },
                    icon: Icon(
                      Icons.content_copy_rounded,
                      color: Colors.black.withOpacity(.6),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Wallet Balance',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 20,
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Text("$amount ETH",
                        style: TextStyle(
                          color: Colors.black.withOpacity(.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    IconButton(
                        onPressed: walletFun,
                        icon: const Icon(
                          Icons.refresh_outlined,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            DefaultButton(text: "Get some fresh ETH", onPress: () {}),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Myhome())),
                child: const Text(
                  "Skip for now!!",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    ));
  }
}
