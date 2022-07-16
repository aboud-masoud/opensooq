import 'package:flutter/material.dart';
import 'package:open_sooq/screens/chat/chat_bloc.dart';

class ChatSearchView extends StatelessWidget {
  final ChatBloc bloc;

  const ChatSearchView({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: bloc.searchController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Search in your chat',
        ),
      ),
    );
  }
}
