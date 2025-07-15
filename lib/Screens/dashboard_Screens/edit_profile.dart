import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          child: Column(
            children: [
              Stack(
                children: [
                  // Profile Picture
                  const CircleAvatar(
                    radius: 50, // adjust as needed
                    backgroundImage: AssetImage(
                      "assets/images/questions_profile_1.jpg",
                    ),
                  ),

                  // Positioned Pencil Icon
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.edit, // pencil icon
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              TextFormField(
                style: const TextStyle(color: Colors.grey),
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.green),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "Name",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(color: Colors.grey),
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.green),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
              ),
              keyboard ? const SizedBox(height: 20) : const Spacer(),
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff339D44),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: Text("Save Changes", style: GoogleFonts.raleway(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
