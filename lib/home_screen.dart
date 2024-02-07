
import 'dart:math';
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
            Expanded(child: ListView(
              shrinkWrap: true,
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
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        elevation: 20,
        height: 60,
        color: Colors.black,
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed:(){
      
        }, icon: const Icon(Icons.home,color: Colors.red,)),
        IconButton(onPressed:(){
          
      
        }, icon: const Icon(Icons.show_chart,color: Colors.white)),
        IconButton(onPressed:(){
          
      
        }, icon: const Icon(Icons.add_circle_outlined,color: Colors.white,)),
        IconButton(onPressed:(){
          
      
        }, icon: const Icon(Icons.note_alt,color: Colors.white)),
        IconButton(onPressed:(){
          
        }, icon: const Icon(Icons.settings,color: Colors.white)),
      
      ],
        ),
      ),
      
          ),
    );
    
  }
}