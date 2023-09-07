import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.maximumLine = 1,
      required this.hintText,
      required this.controller,
      this.height = 70});
  final int maximumLine;
  final String hintText;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2C3E50),
              Color(0xFFBDC3C7),
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "please fill the $hintText".toLowerCase();
            }
            return null;
          },
          maxLines: maximumLine,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: hintText,
              labelStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
