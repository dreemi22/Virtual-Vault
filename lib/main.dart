import 'package:flutter/material.dart';
import 'package:virtualvault/pages/about.dart';
import 'package:virtualvault/pages/authentication/authenticatewallet.dart';
import 'package:virtualvault/pages/authentication/createwallet.dart';
import 'package:virtualvault/pages/home.dart';
import 'package:virtualvault/pages/wallet_profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'createwallet',
    routes: {
      'home': (context) => const Myhome(),
      'about': (context) => const Myabout(),
      'createwallet': (context) => const CreateWallet(),
      'authenticatewallet': (context) => const AuthenticateWallet(),
      'walletprofile': (context) => const WalletProfile(),
    },
  ));
}
