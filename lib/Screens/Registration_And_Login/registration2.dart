import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widgets/textBox_Widget.dart';

class Registration2 extends StatefulWidget {
  const Registration2({super.key});

  @override
  State<Registration2> createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  final List<String> expertiseOptions = [
    'Flutter',
    'Python',
    'WordPress',
    'Video Editing',
    'Facebook Page Management',
    'Excel',
    'Data Entry',
  ];

  String? selectedExpertise;

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
                    color: Color(0xffb4b4b4),
                  ),
                ),
                SizedBox(height: 20),
                ReUsableContainerWithDashes(label: "Upload Profile Image"),
                SizedBox(height: 15),
                ExpertiseDropdownField(),
                SizedBox(height: 15),
                TextBoxWithOutDashes(label: "Qualification"),
                SizedBox(height: 15),
                ReUsableContainerWithDashes(label: "Upload Latest Degree"),
                SizedBox(height: 15),
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffD4D4D4), width: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 3,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        cursorColor: Colors.blue,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
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
                SizedBox(height: 15),
                TextBoxWithOutDashes(label: "Contact"),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          content: SizedBox(
                            height: 250,
                            width: 400 ,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.done_all, color: Colors.green, size: 50),
                                SizedBox(height: 20),
                                Text(
                                  "Account Created",
                                  style: GoogleFonts.raleway(
                                    fontSize: 23.03,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff292929),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "You can now access your account",
                                  style: GoogleFonts.raleway(
                                    fontSize: 13.33,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffB4B4B4),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff339D44),
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    )
                                  ),
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff339D44),
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
                  onPressed: () {},
                  child: Text(
                    "Back",
                    style: GoogleFonts.raleway(
                      fontSize: 13.33,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff339D44),
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




class ExpertiseDropdownField extends StatefulWidget {
  @override
  _ExpertiseDropdownFieldState createState() => _ExpertiseDropdownFieldState();
}

class _ExpertiseDropdownFieldState extends State<ExpertiseDropdownField> {
  final List<String> _expertiseList = [
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
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: InputDecoration(
        hintText: 'Your Expertise',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      isExpanded: true,
      icon: Icon(Icons.arrow_drop_down),
      items: _expertiseList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedExpertise = newValue;
        });
      },
    );
  }
}
