//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:http/http.dart' as http;

class Myupload extends StatelessWidget {
  const Myupload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Uploads',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: Color(0xff1F4CA4),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(100),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 100,
                        
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            color: Color(0xff1F4CA4),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            icon: Icon(Icons.folder),
                            //iconSize: 100,
                          ),
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


