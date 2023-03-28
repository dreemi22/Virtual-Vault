import 'package:flutter/material.dart';
import 'package:virtualvault/pages/about.dart';
import 'package:virtualvault/pages/authentication/authenticatewallet.dart';
import 'package:virtualvault/pages/authentication/createwallet.dart';
import 'package:virtualvault/pages/forpass.dart';
import 'package:virtualvault/pages/home.dart';
import 'package:virtualvault/pages/login.dart';
import 'package:virtualvault/pages/signup.dart';
import 'package:virtualvault/pages/upload.dart';
import 'package:virtualvault/pages/wallet_profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'createwallet',
    routes: {
      'login': (context) => const Mylogin(),
      'signup': (context) => const Mysignup(),
      'forpass': (context) => const Myforpass(),
      'home': (context) => const Myhome(),
      'about': (context) => const Myabout(),
      'upload': (context) => const Myupload(),
      'createwallet': (context) => const CreateWallet(),
      'authenticatewallet': (context) => const AuthenticateWallet(),
      'walletprofile': (context) => const WalletProfile(),
    },
  ));
}
