// ignore_for_file: prefer_const_constructors
import 'package:assignment_saleheen/child/child_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import "package:assignment_saleheen/home_screen.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:ui';

// ...



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
        home: (FirebaseAuth.instance.currentUser == null) ? LoginScreen() : HomeScreen(),
    );
  }
}