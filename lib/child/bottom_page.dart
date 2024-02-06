
import 'package:assignment_saleheen/child/chat_page.dart';
import 'package:assignment_saleheen/child/contacts_page.dart';
import 'package:assignment_saleheen/child/profile_page.dart';
import 'package:assignment_saleheen/child/review_page.dart';
import 'package:assignment_saleheen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    ContactsPage(),
    ChatPage(),
    ProfilePage(),
    ReviewPage(),
  ];
  onTapped(int index){
    setState(){
      currentIndex = index;
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: currentIndex,
       type: BottomNavigationBarType.fixed,
       onTap: onTapped,
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
              Icons.home,
            )),
            BottomNavigationBarItem(
              label: 'contacts',
            icon: Icon(
              Icons.contacts,
            )),
            BottomNavigationBarItem(
              label: 'chats',
            icon: Icon(
              Icons.chat,
            )),
             BottomNavigationBarItem(
              label: 'Profile',
            icon: Icon(
              Icons.person,
            )),
            BottomNavigationBarItem(
              label: 'Reviews',
            icon: Icon(
              Icons.reviews,
            ))
        ],
        ),
    );
  }
}