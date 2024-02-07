
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'Database.dart';
import 'msg.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message, required this.textEditingController});

  final Message message;
  final TextEditingController textEditingController;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {



  @override
  Widget build(BuildContext context) {

    bool Me = DatabaseService.user.uid == widget.message.fromId;
    return Me? myMessage() : othersMessage();
  }

  Widget othersMessage(){


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(40 ),
            margin: EdgeInsets.symmetric(
                horizontal: 40, vertical: 10
            ),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 133, 133, 133),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
            ),
            child:
            Text(widget.message.msg,style: const TextStyle(color: Colors.white,fontSize: 15),)

          ),
        ),
      ],
    );
  }

  Widget myMessage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 40,),
            if(widget.message.read.isNotEmpty) const Icon(Icons.done_all_rounded, color: Colors.blue,size: 20,),
            const SizedBox(width: 2,),

          ],
        ),

        Flexible(
          child: Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.symmetric(
                horizontal: 40, vertical: 10
            ),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 163, 52, 250),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )
            ),
            child: Text(widget.message.msg,style: const TextStyle(color: Colors.white,fontSize: 15),)

          ),
        ),

      ],
    );
  }


}

