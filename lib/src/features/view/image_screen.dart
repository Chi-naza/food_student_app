import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? file;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 280,
            height: 190,
            decoration: BoxDecoration(border: Border.all()),
            margin: EdgeInsets.only(bottom: 50, top: 60),
            child: file == null
                ? Icon(
                    Icons.photo_outlined,
                    size: 65,
                  )
                : Image.file(
                    File(file!.path),
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getAnImageFromCamera();
        },
        child: const Icon(Icons.photo),
      ),
    );
  }

  Future<void> getAnImage() async {
    file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      print("IMAGE FILE: ${file!.path}");
      setState(() {});
    } else {
      print("Encountered an error with image");
    }
  }

  Future<void> getAnImageFromCamera() async {
    file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      print("IMAGE FILE: ${file!.path}");
      setState(() {});
    } else {
      print("Encountered an error with image");
    }
  }
}
