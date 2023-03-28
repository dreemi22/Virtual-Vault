import 'package:flutter/material.dart';

class Myforpass extends StatefulWidget {
  const Myforpass({super.key});

  @override
  State<Myforpass> createState() => _MyforpassState();
}

class _MyforpassState extends State<Myforpass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/demo.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 130, left: 35),
              child: const Text(
                'Create New\nPassword',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 370, right: 30, left: 30),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(Icons.email, size: 17)),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: 'Phone No.',
                          suffixIcon: Icon(
                            Icons.phone,
                            size: 17,
                          )),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'New Password',
                          suffixIcon: Icon(
                            Icons.visibility,
                            size: 17,
                          )),
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
                              Navigator.pushNamed(context, 'login');
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
