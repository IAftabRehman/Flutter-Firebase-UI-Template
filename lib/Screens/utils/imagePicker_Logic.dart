import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class ImagePickerWidget extends StatefulWidget {
  final String imageType;
  const ImagePickerWidget({super.key, required this.imageType});
  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final imagePicked = await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      setState(() {
        _pickedImage = File(imagePicked.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No image selected for ${widget.imageType}")),
      );
    }
  }

  // Future<void> _uploadImage() async {
  //   if (_pickedImage == null) return;
  //
  //   try {
  //     // Generate unique filename
  //     final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
  //
  //     // Read bytes from the selected file
  //     final bytes = await _pickedImage!.readAsBytes();
  //
  //     // Upload to Supabase Storage
  //     final response = await Supabase.instance.client.storage
  //         .from('images') // <-- Your bucket name
  //         .uploadBinary(
  //       'public/$fileName', // <-- Folder path inside bucket
  //       bytes,
  //       fileOptions: const FileOptions(contentType: 'image/jpeg'),
  //     );
  //
  //     // Show a success message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('✅ Uploaded: $response')),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('❌ Upload failed: $e')),
  //     );
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: DottedBorder(
        color: Colors.green,
        strokeWidth: 1.5,
        dashPattern: [9, 9],
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  _pickedImage != null
                      ? "${widget.imageType} Successfully Uploaded"
                      : "Upload Your ${widget.imageType} Image",
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/video_uploader.png',
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

