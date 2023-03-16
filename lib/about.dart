import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Myabout extends StatefulWidget {
  const Myabout({super.key});

  @override
  State<Myabout> createState() => _MyaboutState();
}

class _MyaboutState extends State<Myabout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'About Us',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: Color(0xff1F4CA4),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Virtual Vault\nBlockchain-based document storage systems. There are lot of documents and licenses which are really very important for us, and we can be needing them any time. So we can build a secure platform with the help of blockchain which can ensure that our documents are safe and easy to access. This system works in the following way:\nThe user will upload their documents to the blockchain system.\nThe government or any system which requires submission of documents can access them from the blockchain with the required permissions from the users.\nThis system is implemented would lead to secure, paperless and quick transactions and would be convenient to the users as well as the government. ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
