import 'package:assignment_saleheen/child/child_home_page.dart';
import 'package:assignment_saleheen/child/child_login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(), 
        builder: (context,snapshot){
      
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ",style: TextStyle(color: Colors.black),),
                  Card(
                    child: ListTile(
                      title: Text(snapshot.data!['name']),
                    ),
                  ),
                  Text("Email: ",style: TextStyle(color: Colors.black),),
                  Card(
                    child: ListTile(
                      title: Text(snapshot.data!['childEmail']),
                    ),
                  ),
                  Text("ID: ",style: TextStyle(color: Colors.black),),
                  Card(
                    child: ListTile(
                      title: Text(snapshot.data!['id']),
                    ),
                  ),
                  Text("Phone Number: ",style: TextStyle(color: Colors.black),),
                  Card(
                    child: ListTile(
                      title: Text(snapshot.data!['phone']),
                    ),
                  ),
                  TextButton(onPressed: ()async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  }, child: Text("Log out",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                ],
                ),
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else{
            return Text("No user data has been found");
          }
        }
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        }, icon: const Icon(Icons.dashboard,color: Colors.black,)),
        
        IconButton(onPressed:(){
          
        }, icon: const Icon(Icons.person,color: Colors.black,)),
        
        IconButton(onPressed:(){
          
        }, icon: const Icon(Icons.settings,color: Colors.black)),
      
      ],
        ),
      ),
    );
  }
}