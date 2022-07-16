import 'package:flutter/material.dart';
import 'package:open_sooq/screens/chat/chat_bloc.dart';
import 'package:open_sooq/screens/chat/widgets/chat_contact_view.dart';
import 'package:open_sooq/screens/chat/widgets/chat_search_view.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bloc = ChatBloc();

  @override
  void initState() {
    super.initState();
    print("chat page is called");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatSearchView(bloc: bloc),
        ChatContactView(bloc: bloc),
      ],
    );
  }
}
