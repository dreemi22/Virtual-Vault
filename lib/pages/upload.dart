import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class Myupload extends StatefulWidget {
  const Myupload({super.key});
  @override
  State<Myupload> createState() => _MyuploadState();
}

class _MyuploadState extends State<Myupload> {
  uploadFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uploads',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xff1F4CA4),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          onPressed: uploadFiles,
          label: const Text('Upload')),
    );
  }
}
