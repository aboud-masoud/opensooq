import 'package:flutter/material.dart';
import 'package:open_sooq/models/profile_option_model.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class OptionView extends StatelessWidget {
  OptionView({Key? key, required this.list}) : super(key: key);
  List<ProfileOption> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: list.length * 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
              child: InkWell(
                onTap: () => list[index].callback(),
                child: Row(
                  children: [
                    optionIcon(
                      backgroundColor: list[index].backgroundColor,
                      myIcon: list[index].icon,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      title: list[index].title,
                      fontSize: 16,
                      fontColor: Colors.black,
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget optionIcon(
      {required Color backgroundColor, required IconData myIcon}) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Icon(
          myIcon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
