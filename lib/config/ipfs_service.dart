import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const ipfsApiKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDAyNTc2MzU3YTkwQ0FhMTMxODU1MGUzRTU4ODNDMzMwYTE1RDkwMzUiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY3OTkzMjc4NjIwOSwibmFtZSI6IlZpcnR1YWwtdmF1bHQifQ.R9U6vmvVm_ElgwQ8_-UnHgXV6pzFBRn5-lBSiLqQEho";
const ipfsURL = 'https://ipfs.io/ipfs/';

class IpfsService {
  Future<String> uploadImage(String imgPath) async {
    try {
      final bytes = File(imgPath).readAsBytesSync();

      final response = await http.post(
        Uri.parse('https://api.nft.storage/upload'),
        headers: {
          'Authorization': 'Bearer $ipfsApiKey',
          'content-type': 'image/*'
        },
        body: bytes,
      );

      final data = jsonDecode(response.body);

      final cid = data['value']['cid'];

      if (kDebugMode) {
        print('CID OF IMAGE -> $cid');
        getImage(cid);
      }
      if (kDebugMode) {
        print('CID: $cid');
      }
      return cid;
    } catch (e) {
      if (kDebugMode) {
        print('Error at IPFS Service - uploadImage: $e');
      }
      rethrow;
    }
  }

  Future<http.Response> getImage(String cid) async {
    try {
      final response = await http.get(Uri.parse(ipfsURL + cid));
      if (kDebugMode) {
        print("Image successfully fetched");
      }

      return response;
    } catch (e) {
      debugPrint('Error at IPFS Service - getImage: $e');

      rethrow;
    }
  }
}
