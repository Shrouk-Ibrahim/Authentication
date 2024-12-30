import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;
  final TextStyle textStyle;
  final TextStyle labelStyle;

  CustomTextFormField({
    required this.label,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    required this.textStyle,
    required this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle, // Apply labelStyle here
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),
        ),
        keyboardType: keyBoardType,
        controller: controller,
        validator: validator,
        obscureText: isPassword,
        style: textStyle, // Apply textStyle here
      ),
    );
  }
}
