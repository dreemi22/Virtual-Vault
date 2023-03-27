import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:virtualvault/config/ipfs_service.dart';
//import 'package:http/http.dart' as http;

class Myupload extends StatefulWidget {
  const Myupload({super.key});
  @override
  State<Myupload> createState() => _MyuploadState();
}

class _MyuploadState extends State<Myupload> {
  String path = "";
  uploadFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      path = file.path;
      print(file.path);
      setState(() {});
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
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              IpfsService ipfsService = IpfsService();
              ipfsService.uploadImage(path);
            },
            child: const Text("Are you sure you want to upload?")),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          onPressed: uploadFiles,
          label: const Text('Upload')),
    );
  }
}
