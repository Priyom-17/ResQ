import 'package:assignment_saleheen/components/custom_text_field.dart';
import 'package:assignment_saleheen/components/primary_button.dart';
import 'package:assignment_saleheen/components/secondary_button.dart';
import 'package:assignment_saleheen/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "USER LOGIN",
                        style: TextStyle(
                          fontSize: 30,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      
                      ),
                      Image.asset(
                    'lib/assets/logoo.png',
                    
                    height: 190,
                    width: 200,
                    ),
                    ],
                  ),
                ),
              ),
              
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                        hintText: 'Enter Name',
                        prefix: Icon(Icons.person),
                      
                      ),
                      CustomTextField(
                    hintText: 'Enter Name',
                    prefix: Icon(Icons.person),
                  ),
                  PrimaryButton(title: 'REGISTER', onPressed: () {}),
                  ],
                  ),
                ),
              ),
              
              
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password!?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                
                    ),
                    SecondaryButton(onPressed: () {}, title: 'Click here'),
                  ],
                ),
              ),
              SecondaryButton(onPressed: () {}, title: 'REGISTER NEW USER'),

            ],
          ),
        )
      ),
    );
  }
}