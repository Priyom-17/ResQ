
import 'dart:math';
import 'package:assignment_saleheen/child/profile.dart';

import 'widgets/home_widgets/emergency.dart';
import 'package:assignment_saleheen/widgets/home_widgets/CustomeCarouel.dart';
import 'package:assignment_saleheen/widgets/home_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/live_safe.dart';



 class HomeScreen  extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen ({super.key});
  int qIndex=0;

 

getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }


@override
  void initState() {
    getRandomQuote();
    super.initState();
   
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children:[
            CustomeAppBar(
              quoteIndex: qIndex,
              onTap:(){
                 getRandomQuote();
              },
            ),
            Expanded(child: Column(
              //shrinkWrap: true,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCarouel(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Emergency",
                    style:
                    TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                  ),
                ),
                Emergency(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Expolre LiveSafe",
                    style:
                    TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                  ),
                ),
                LiveSafe(),
                ],))
            
          ],
          ),
        ),
          bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.black,
        elevation: 20,
        height: 60,
        color: Colors.white,
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed:(){
      
        }, icon: const Icon(Icons.dashboard,color: Colors.black,)),
        
        IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
      
        }, icon: const Icon(Icons.person,color: Colors.black,)),
        
        IconButton(onPressed:(){
          
        }, icon: const Icon(Icons.settings,color: Colors.black)),
      
      ],
        ),
      ),
      
          ),
    );
    
  }
}