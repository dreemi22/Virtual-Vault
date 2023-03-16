import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Myforpass extends StatefulWidget {
  const Myforpass({super.key});

  @override
  State<Myforpass> createState() => _MyforpassState();
}

class _MyforpassState extends State<Myforpass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/demo.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 130, left: 35),
              child: Text(
                'Create New\nPassword',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 370, right: 30, left: 30),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          )),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Phone No.',
                          suffixIcon: Icon(
                            FontAwesomeIcons.phone,
                            size: 17,
                          )),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'New Password',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eyeSlash,
                            size: 17,
                          )),
                    ),
                    SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff1F4CA4),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            icon: Icon(Icons.arrow_forward),
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
