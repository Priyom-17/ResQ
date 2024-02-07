
import 'package:assignment_saleheen/child/chat/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Database.dart';
import 'chat_user_card.dart';



class Chat_Room extends StatefulWidget {
  const Chat_Room({super.key});

  @override
  State<Chat_Room> createState() => _Chat_RoomState();
}

class _Chat_RoomState extends State<Chat_Room> {

  List<AnUser> list =[];
  final List<AnUser> _searchList = [];
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Chat Room",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        
      ),
      body: StreamBuilder(
          stream: DatabaseService.getAllUsers(),
          builder: (context, snapshot){

            switch(snapshot.connectionState){
            //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator(),);

            //if data is loaded
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                list = data?.map((e) => AnUser.fromJson(e.data())).toList() ?? [];
                if(list.isNotEmpty){
                  return ListView.builder(
                      itemCount: list.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return ChatUserCard(user: list[index]);
                      }
                  );
                }
                else{
                  return const Center(child: Text("No Connection Found",style: TextStyle(color: Colors.black),));
                }
            }
          }
      ),
    );
  }
}


//17 no video dkhsi