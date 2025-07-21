import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class TextBoxWithOutDashes extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  const TextBoxWithOutDashes({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.grey),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.green),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: label,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      ),
    );
  }
}


class ReUsableContainerWithDashes extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const ReUsableContainerWithDashes({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.green,
      strokeWidth: 1.5,
      dashPattern: [9, 9],
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 18, color: Colors.black),
            cursorColor: Colors.blue,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              labelStyle: TextStyle(color: Colors.black, fontSize: 13),
              hintStyle: TextStyle(fontSize: 17),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: Image.asset(
                    fit: BoxFit.contain,
                    'assets/images/video_uploader.png',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}