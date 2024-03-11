import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewImages extends StatefulWidget {
  const ViewImages({Key? key}) : super(key: key);

  @override
  State<ViewImages> createState() => _ViewImagesState();
}

class _ViewImagesState extends State<ViewImages> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Images'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _pickImageFromGallery();
                  });
                },
                child: const Text('Image From Gallery'),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _pickImageFromCamera();
                  });
                },
                child: const Text('Image From Camera'),
              ),
              const SizedBox(height: 20),
              selectedImage != null
                  ? Image.file(selectedImage!)
                  : const Text('Add An Image'),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      selectedImage = File(image.path);
    });
  }

  Future _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      selectedImage = File(image.path);
    });
  }
}
