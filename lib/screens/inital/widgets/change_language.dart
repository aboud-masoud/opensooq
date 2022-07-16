import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class InitialChangeLanguage extends StatelessWidget {
  final int languageSelectedIndex;
  final Function(int) valueChanged;

  const InitialChangeLanguage(
      {required this.languageSelectedIndex,
      required this.valueChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 54,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: CupertinoSlidingSegmentedControl<int>(
          thumbColor: CupertinoColors.systemBlue,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(8),
          groupValue: languageSelectedIndex,
          children: {
            0: buildSegment("English", languageSelectedIndex == 0),
            1: buildSegment("Turkish", languageSelectedIndex == 1),
            2: buildSegment("العربية", languageSelectedIndex == 2),
          },
          onValueChanged: (value) {
            valueChanged(value!);
          },
        ),
      ),
    );
  }

  Widget buildSegment(String text, bool selected) {
    return CustomText(
      title: text,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontColor: selected ? Colors.white : Colors.black,
    );
  }
}
