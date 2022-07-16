import 'package:cloud_firestore/cloud_firestore.dart';

class ContactChatModel {
  final String fullname;
  final String chatDate;
  final String lastMessage;
  final String avatar;
  final String userID;

  ContactChatModel(
      {required this.avatar,
      required this.fullname,
      required this.lastMessage,
      required this.chatDate,
      required this.userID});

  factory ContactChatModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String avatar = documentSnapshot.get("avatar");
    String fullname = documentSnapshot.get("full name");
    String lastMessage = documentSnapshot.get("last chat");
    String chatDate = documentSnapshot.get("date");
    String userID = documentSnapshot.get("userid");

    return ContactChatModel(
        avatar: avatar,
        fullname: fullname,
        lastMessage: lastMessage,
        chatDate: chatDate,
        userID: userID);
  }
}
