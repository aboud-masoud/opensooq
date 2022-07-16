import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_sooq/models/contact_chat_model.dart';
import 'package:open_sooq/screens/chat/chat_bloc.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class ChatContactView extends StatelessWidget {
  final ChatBloc bloc;

  const ChatContactView({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: bloc.chatUserCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              bloc.fillChatContactList(streamSnapshot.data!.docs);

              if (streamSnapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      var bottomPadding =
                          index == streamSnapshot.data!.docs.length - 1
                              ? 25
                              : 0;
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: bottomPadding.toDouble()),
                        child: SizedBox(
                          height: 90,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: Image.network(
                                  bloc.chatContactList[index].avatar,
                                  scale: 5,
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    title: bloc.chatContactList[index].fullname,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColor: const Color(0xff444444),
                                  ),
                                  CustomText(
                                    title:
                                        bloc.chatContactList[index].lastMessage,
                                    fontSize: 12,
                                    fontColor: const Color(0xff444444),
                                  )
                                ],
                              )),
                              CustomText(
                                title: bloc.chatContactList[index].chatDate,
                                fontSize: 12,
                                fontColor: const Color(0xff444444),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: const Color(0xff444444),
                          height: 1,
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CustomText(
                    title: "No Data To Show",
                    fontSize: 20,
                    fontColor: Colors.black,
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
