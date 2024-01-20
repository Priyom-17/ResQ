// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:assignment_saleheen/home_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // scaffoldMessengerKey: navigatorkey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.firaSansTextTheme(
            Theme.of(context).textTheme,
          ),
          
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}