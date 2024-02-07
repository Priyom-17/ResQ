//import 'package:cached_network_image/cached_network_image.dart';

import 'package:assignment_saleheen/child/chat/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Database.dart';
import 'inbox.dart';
import 'msg.dart';





class ChatUserCard extends StatefulWidget {

  final AnUser user;

  const ChatUserCard({super .key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {

  //last message info (if null --> no message
  Message? _message;

  @override
  Widget build(BuildContext context) {



    return Card(
      color: Colors.white,
      child: InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (_) => ChatScreen(user: widget.user,)));
          },
          child: StreamBuilder(
              stream: DatabaseService.getLastMessage(widget.user),
              builder: (context, snapshot){
                final data = snapshot.data?.docs;
                final _list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
                if(_list.isNotEmpty){
                  _message = _list[0];
                }

                return ListTile(

                  title: Text(widget.user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,color: Colors.black
                    ),
                  ),

                    subtitle: Text(_message != null
                        ?
                    _message!.msg
                        :
                    "Start Conversation! 👋",
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color:  (_message != null && _message!.fromId != DatabaseService.user.uid) ? Colors.black : Colors.black38
                      ),
                    ),

                    //trailing: const Text("Time",style: TextStyle(color: Colors.white30,fontSize: 12),),

                );
              }
          )
      ),
    );
  }
}
