import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 6, 98, 156),
          ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 6, 98, 156),
          ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 6, 98, 156),
          ),
          ),
      ),
    );
  }
}