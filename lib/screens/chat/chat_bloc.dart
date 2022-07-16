import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:open_sooq/models/contact_chat_model.dart';

class ChatBloc {
  TextEditingController searchController = TextEditingController();

  final CollectionReference chatUserCollection =
      FirebaseFirestore.instance.collection('chatUsers');

  List<ContactChatModel> chatContactList = [];

  Future<void> fillChatContactList(
      List<QueryDocumentSnapshot<Object?>> firebaseList) async {
    for (var firebaseItem in firebaseList) {
      chatContactList.add(ContactChatModel.fromDocument(firebaseItem));

      // chatUserCollection.add({"test": "test"});

      // await chatUserCollection.doc(searchController.text).set({"aa": ""});
    }
  }
}
