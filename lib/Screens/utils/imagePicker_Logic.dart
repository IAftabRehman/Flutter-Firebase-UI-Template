// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class ImagePickerWidget extends StatefulWidget {
//   final String imageType;
//   const ImagePickerWidget({super.key, required this.imageType});
//   @override
//   State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
// }
//
// class _ImagePickerWidgetState extends State<ImagePickerWidget> {
//   File? _pickedImage;
//   final picker = ImagePicker();
//
//   Future<void> _pickImage() async {
//     final imagePicked = await picker.pickImage(source: ImageSource.gallery);
//     if (imagePicked != null) {
//       setState(() {
//         _pickedImage = File(imagePicked.path);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("No image selected for ${widget.imageType}")),
//       );
//     }
//   }
//   // bool _isUploading = false;
//   // String? _uploadedImageUrl;
//
//   Future<void> uploadImage() async {
//     if (_pickedImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please select an image first")),
//       );
//       return;
//     }
//
//     setState(() => _isUploading = true);
//
//     try {
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       final filePath = 'public/$fileName.jpg';
//       final bytes = await _pickedImage!.readAsBytes();
//
//       // final response = await Supabase.instance.client.storage
//       //     .from('image')
//       //     .uploadBinary(filePath, bytes);
//
//       final imageUrl = Supabase.instance.client.storage
//           .from('image')
//           .getPublicUrl(filePath);
//
//       setState(() {
//         _uploadedImageUrl = imageUrl;
//         _isUploading = false;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Image uploaded successfully!")),
//       );
//     } catch (e) {
//       setState(() => _isUploading = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Upload failed: $e")),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _pickImage,
//       child: DottedBorder(
//         color: Colors.green,
//         strokeWidth: 1.5,
//         dashPattern: [9, 9],
//         borderType: BorderType.RRect,
//         radius: Radius.circular(10),
//         child: SizedBox(
//           height: 60,
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 Text(
//                   _pickedImage != null
//                       ? "${widget.imageType} Successfully Uploaded"
//                       : "Upload Your ${widget.imageType} Image",
//                 ),
//                 const Spacer(),
//                 Image.asset(
//                   'assets/images/video_uploader.png',
//                   height: 35,
//                   fit: BoxFit.contain,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
