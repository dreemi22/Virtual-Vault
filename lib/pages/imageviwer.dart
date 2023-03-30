import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DocViewer extends StatefulWidget {
  final String imageCid;
  const DocViewer({super.key, required this.imageCid});

  @override
  State<DocViewer> createState() => _DocViewerState();
}

class _DocViewerState extends State<DocViewer> {
  String ipfsURL = 'https://ipfs.io/ipfs/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Document Viewer")),
        body: PhotoView(imageProvider: NetworkImage(ipfsURL + widget.imageCid)));
  }
}
