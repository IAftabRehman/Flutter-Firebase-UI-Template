import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answers extends StatefulWidget {
  const Answers({super.key});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_left, size: 45, color: Colors.green),
        title: Text("Answer", style: GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
