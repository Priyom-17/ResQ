import 'dart:ui';

import 'package:flutter/material.dart';

Color primaryColor=Color(0xfffc3b77);
void goTo(BuildContext context,Widget nextScreen){
   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>nextScreen,
                    ));
}