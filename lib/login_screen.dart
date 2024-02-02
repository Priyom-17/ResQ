import 'package:assignment_saleheen/components/custom_text_field.dart';
import 'package:assignment_saleheen/components/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "USER LOGIN",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xfffc3b77),
                  fontWeight: FontWeight.bold,
                ),

              ),
              Image.asset(
                'lib/assets/logoo.png',
                height: 250,
                width: 400,
                ),
              CustomTextField(
                hintText: 'Enter Name',
                prefix: Icon(Icons.person),

              ),
              CustomTextField(
                hintText: 'Enter Name',
                prefix: Icon(Icons.person),
              ),
              PrimaryButton(),

            ],
          ),
        )
      ),
    );
  }
}