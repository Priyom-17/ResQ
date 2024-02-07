import 'dart:io';


import 'package:assignment_saleheen/child/chat/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Database.dart';
import 'msg.dart';
import 'msg_card.dart';


class ChatScreen extends StatefulWidget {

  final AnUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<Message> _list = [] ;
  final _textController = TextEditingController();
 
  final controller = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey,
            flexibleSpace: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back),color: Colors.white),



                const SizedBox(width: 10,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),

          body: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: DatabaseService.getAllmessages(widget.user),
                    builder: (context, snapshot){


                      switch(snapshot.connectionState){
                      //if data is loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return const SizedBox();

                      //if data is loaded
                        case ConnectionState.active:
                        case ConnectionState.done:
                          final data = snapshot.data?.docs;

                          _list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];

                          if(_list.isNotEmpty){
                            return ListView.builder(
                                reverse: true,
                                itemCount: _list.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context,index){
                                  return MessageCard(message: _list[index],textEditingController: _textController,);
                                }

                            );
                          }
                          else{
                            return const Center(child: Text("Start Conversation! 👋",style: TextStyle(color: Colors.black,fontSize: 20),));
                          }
                      }
                    }
                ),
              ),

              

              //chat input widget
              _chatInput(),


            ],
          ),
        ),
      ),
    );
  }
  Widget _chatInput(){
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.black12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      FocusScope.of(context).unfocus();
                      
                    },
                    icon: const Icon(Icons.emoji_emotions,color: Colors.black,)
                ),
                Expanded(
                    child: TextField(

                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'write your thoughts',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    )
                ),


                SizedBox(width: 20,)
              ],
            ),
          ),
        ),

        MaterialButton(
          minWidth: 0,
          padding: const EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 10),
          shape: const CircleBorder(),
          onPressed: (){
            if(_textController.text.isNotEmpty){
              DatabaseService.sendMessage(widget.user, _textController.text.trim(),'text');
              _textController.text = '';
            }
          },
          color: Colors.blueAccent,
          child: const Icon(Icons.send,color: Colors.white,),
        )
      ],

    );

  }

}
