import 'package:flutter/material.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({super.key});

  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/demo1.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 130, left: 35),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 370,
                  right: 30,
                  left: 30,
                ),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        suffixIcon: Icon(
                          Icons.person_4,
                          size: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(
                          Icons.email,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.visibility,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            color: const Color(0xff1F4CA4),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        )
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
