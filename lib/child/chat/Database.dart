
import 'package:assignment_saleheen/child/chat/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'msg.dart';

class DatabaseService{
  static final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection("users");



  static User get user => FirebaseAuth.instance.currentUser!;

  static late AnUser me;

  //collect user information
  static Future collectUserInfo ({required String name,required String username,required bool isOnline, required String birthDate, required String gender, required String email, required String pass, required String image, required String about, required String createdAt, required String lastActive, required String pushToken}) async {
    final docUserInfo = userInfoCollection.doc(FirebaseAuth.instance.currentUser?.uid);
    final zenfituser = AnUser(
      id: docUserInfo.id,
      name: name,

      gender: gender,
      email: email,
      gemail: '',
    );

    return await userInfoCollection.doc(FirebaseAuth.instance.currentUser?.uid).set(zenfituser.toJson());
  }







  ///****************** Chat Screen Related APIs************************



  //get all users for chatroom
  static Stream<QuerySnapshot<Map<String, dynamic>>>getAllUsers(){
    return FirebaseFirestore.instance.collection('users').where('id', isNotEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots();
  }

  //useful for getting conversation id
  static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  //for getting all messages of a specific conversation from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>>getAllmessages(AnUser user){
    return FirebaseFirestore.instance
        .collection('chatroom')
        .doc(getConversationID(user.id))
        .collection('messages')
        .orderBy('sent',descending: true)
        .snapshots();
  }

  // for sending message
  static Future<void> sendMessage(AnUser zenfituser, String msg, String type) async {

    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        msg: msg,
        read: '',
        toId: zenfituser.id,
        type: type,
        fromId: user.uid,
        sent: time
    );

    final ref = FirebaseFirestore.instance.collection('chatroom').doc(getConversationID(zenfituser.id)).collection('messages');
    await ref.doc(time).set(message.toJson());

  }


  //get only last message of a specific chat
  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(AnUser user){
    return FirebaseFirestore.instance
        .collection('chatroom/${getConversationID(user.id)}/messages/')
        .orderBy('sent',descending: true)
        .limit(1)
        .snapshots();
  }














}


