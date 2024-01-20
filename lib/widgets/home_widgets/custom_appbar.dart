


import 'package:assignment_saleheen/utils/quotes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeAppBar extends StatelessWidget {
 // const CustomeAppBar({super.key});
 Function? onTap;
 int? quoteIndex;
 CustomeAppBar({this.onTap,this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        
        child: Text(
          sweetSayings[quoteIndex!],
        style: TextStyle(fontSize: 22),),
      ),
    );
  }
} 