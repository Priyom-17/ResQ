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

dialogueBox(BuildContext context,String text)
{
  showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      title:Text(text),
    ),
    );
}

progresIndicator(BuildContext context)
{
  showDialog(
      barrierDismissible:  false,
      context: context, builder:  (context) => Center(child: CircularProgressIndicator()));
}