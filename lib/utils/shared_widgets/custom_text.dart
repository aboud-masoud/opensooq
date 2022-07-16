import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color fontColor;
  final int maxLine;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const CustomText(
      {required this.title,
      required this.fontSize,
      this.fontColor = Colors.white,
      this.maxLine = 1,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine,
      textAlign: textAlign,
      style: GoogleFonts.ubuntu(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}