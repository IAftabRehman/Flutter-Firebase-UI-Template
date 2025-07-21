import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePick extends StatefulWidget {
  const imagePick({super.key});

  @override
  State<imagePick> createState() => _imagePickState();
}

class _imagePickState extends State<imagePick> {
  File? _image;
  final picker = ImagePicker();


  Future getGalleryImage() async {
    final picfile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(picfile != null){
        _image = File(picfile.path);
      }else{
        print("Not get Image");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                getGalleryImage();
              },
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2
                    )
                  ),
                  child: _image != null ?  Image.file(_image!.absolute, width: 200, height: 200, fit: BoxFit.cover): Icon(Icons.image, size: 40)
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: Text("Upload"))
          ],
        ),
      ),
    );
  }
}
