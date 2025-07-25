import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_first_task/Data/Models/registrationModel.dart';
import 'package:internship_first_task/Data/Services/RegistrationServices.dart';
import 'package:internship_first_task/Screens/Registration_And_Login/login.dart';
import 'package:internship_first_task/Screens/Registration_And_Login/registration.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../Data/Services/AuthenticationServices.dart';
import '../../Widgets/textBox_Widget.dart';

class Registration2 extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const Registration2({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  State<Registration2> createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  bool isLoading = false;
  TextEditingController profileImage = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController latestDegree = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contact = TextEditingController();

  // Future<void> _uploadImage() async {
  //   if (_image == null) return;
  //   final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   final bytes = await _image!.readAsBytes();
  //   final response = await Supabase.instance.client.storage
  //       .from('images')
  //       .uploadBinary('public/$fileName.jpg', bytes);
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text('Uploaded: $response')));
  // }

  final List<String> expertiseOptions = const [
    'Flutter',
    'Python',
    'WordPress',
    'Video Editing',
    'Facebook Page Management',
    'Excel',
    'Data Entry',
  ];

  String? expertise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Details",
                  style: GoogleFonts.raleway(
                    fontSize: 23.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enter your personal details",
                  style: GoogleFonts.raleway(
                    fontSize: 13.33,
                    color: const Color(0xffb4b4b4),
                  ),
                ),
                const SizedBox(height: 20),
                ImagePickerWidget(imageType: "Profile"),
                const SizedBox(height: 15),
                CustomDropDownWidget(
                  onChanged: (value) {
                    setState(() {
                      expertise = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                TextBoxWithOutDashes(
                  label: "Qualification",
                  controller: qualification,
                ),
                const SizedBox(height: 15),
                ImagePickerWidget(imageType: "Degree"),
                const SizedBox(height: 15),
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffD4D4D4),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: address,
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.blue,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Address",
                          labelStyle: TextStyle(
                            color: Color(0xffD4D4D4),
                            fontSize: 13,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextBoxWithOutDashes(label: "Contact", controller: contact),
                const SizedBox(height: 25),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () async {
                          try {
                            isLoading = true;
                            setState(() {});
                            AuthenticationServices()
                                .registerUser(
                                  email: widget.email,
                                  password: widget.password,
                                )
                                .then((val) async {
                                  await RegistrationServices()
                                      .createAccount(
                                        RegistrationModel(
                                          name: widget.name,
                                          email: widget.email,
                                          password: widget.password,
                                          profileImage: profileImage.text,
                                          expertise: expertise.toString(),
                                          qualification: qualification.text,
                                          degreeImage: latestDegree.text,
                                          address: address.text,
                                          contact: contact.text,
                                          docId: DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          createdAt: DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                        ),
                                      )
                                      .then((val) async {
                                  });
                                  isLoading = false;
                                  setState(() {});
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: 250,
                                          width: 400,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.done_all,
                                                color: Colors.green,
                                                size: 50,
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                "Account Created",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 23.03,
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color(
                                                    0xff292929,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "You can now access your account",
                                                style: GoogleFonts.raleway(
                                                  fontSize: 13.33,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color(
                                                    0xffB4B4B4,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Login(),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(
                                                    0xff339D44,
                                                  ),
                                                  minimumSize: Size(
                                                    double.infinity,
                                                    50,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Login",
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff339D44),
                          minimumSize: Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Registration(),
                      ),
                    );
                  },
                  child: Text(
                    "Back",
                    style: GoogleFonts.raleway(
                      fontSize: 13.33,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff339D44),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This is a widget, where is only use for DropDown
class CustomDropDownWidget extends StatefulWidget {
  final ValueChanged<String?> onChanged;

  const CustomDropDownWidget({super.key, required this.onChanged});

  @override
  _CustomDropDownWidgetState createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  final List<String> _expertiseList = const [
    'Flutter',
    'Python',
    'WordPress',
    'Excel',
    'Data Entry',
    'Facebook Page',
    'Video Editing',
  ];

  String? _selectedExpertise;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedExpertise,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: InputDecoration(
        hintText: 'Your Expertise',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      items: _expertiseList.map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedExpertise = newValue;
        });
        widget.onChanged(newValue);
      },
    );
  }
}



class ImagePickerWidget extends StatefulWidget {
  final String imageType;

  const ImagePickerWidget({super.key, required this.imageType});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;
  final picker = ImagePicker();
  bool _isUploading = false;
  String? _uploadedImageUrl;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      await _uploadImage(File(pickedFile.path));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No image selected for ${widget.imageType}")),
      );
    }
  }

  Future<void> _uploadImage(File image) async {
    try {
      setState(() {
        _isUploading = true;
      });

      final bytes = await image.readAsBytes();
      final fileName = '${widget.imageType}_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final response = await Supabase.instance.client.storage
          .from('images')
          .uploadBinary('public/$fileName', bytes);

      final url = Supabase.instance.client.storage
          .from('images')
          .getPublicUrl('public/$fileName');

      setState(() {
        _uploadedImageUrl = url;
        _isUploading = false;
      });

      // Pass URL to parent TextEditingController
      if (widget.imageType == "Profile") {
        final registration2State = context.findAncestorStateOfType<_Registration2State>();
        registration2State?.profileImage.text = _uploadedImageUrl ?? '';
      } else if (widget.imageType == "Degree") {
        final registration2State = context.findAncestorStateOfType<_Registration2State>();
        registration2State?.latestDegree.text = _uploadedImageUrl ?? '';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.imageType} image uploaded successfully')),
      );
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Upload failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [6, 3],
        color: Colors.grey,
        strokeWidth: 2,
        child: Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          child: _isUploading
              ? const CircularProgressIndicator()
              : _pickedImage != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              _pickedImage!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.upload_file, size: 40, color: Colors.grey),
              const SizedBox(height: 8),
              Text("Upload ${widget.imageType} Image",
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}


