import 'package:flutter/material.dart';
import 'package:virtualvault/config/walletprovider.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  WalletProvider walletProvider = WalletProvider();
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/demo.jpg'),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 90, left: 65),
              child: const Text(
                'Welcome to\nVirtual Vault',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 370, left: 30, right: 30),
                child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                          hintText: 'Private Key',
                          suffixIcon: Icon(
                            Icons.key_off_outlined,
                            size: 17,
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          size: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff1F4CA4),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                // Navigator.pushNamed(context, 'home');
                                walletProvider.initializeFromKey(textController.text);
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff1F4CA4)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'forpass');
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff1F4CA4)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
