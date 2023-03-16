import 'package:flutter/material.dart';
import 'package:virtualvault/login.dart';
import 'package:virtualvault/signup.dart';
import 'package:virtualvault/forpass.dart';
import 'package:virtualvault/home.dart';
import 'package:virtualvault/about.dart';
import 'package:virtualvault/upload.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' :(context) => Mylogin(),
      'signup' :(context) => Mysignup(),
      'forpass' :(context) => Myforpass(),
      'home' :(context) => Myhome(),
      'about' :(context) => Myabout(),
      'upload' :(context) => Myupload()
    },
  ));
}
