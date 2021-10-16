import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              selectImage();
            },
            child: const Text(
              'Upload Image',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  void selectImage() async {
    List<XFile>? selectedImages =
        await _imagePicker.pickMultiImage(); //get list of multiple images
    if (selectedImages!.isNotEmpty) {
      _imageFileList.clear();
      _imageFileList.addAll(selectedImages);
      for (XFile image in _imageFileList) {
        String fileName = basename(image.path);
        File file = File(image.path);
        uploadImage(file, fileName);
      }
    }
  }

  Future uploadImage(File imageFile, String fileName) async {
    try {
      final destination = 'Dishes_image/$fileName';

      final ref = FirebaseStorage.instance.ref().child(destination);
      ref.putFile(imageFile);
    } catch (e) {
      debugPrint('There was an error while uploading a file');
    }
  }
}
