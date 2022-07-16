import 'package:flutter/material.dart';

class ProfileOption {
  String title;
  Color backgroundColor;
  IconData icon;
  Function() callback;

  ProfileOption(
      {required this.title,
      required this.backgroundColor,
      required this.icon,
      required this.callback});
}
