import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

bool isContactButtomSheetIsShown = false;

Future<Widget> contactButtomSheet(BuildContext context) async {
  return await Get.bottomSheet(
    SizedBox(
      height: 316,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(height: 8),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width - 16,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CustomText(
                    title: "Report a Problem",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontColor: Color(0xff444444),
                  ),
                  const SizedBox(height: 5),
                  const CustomText(
                    title: "Your feedback help us to improve",
                    fontSize: 12,
                    fontColor: Color(0xff444444),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/images/contact-us.png",
                    width: 75,
                    height: 75,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xff444444))),
                    child: const Center(
                      child: CustomText(
                        title: "Contact us through Whatsapp",
                        fontSize: 15,
                        fontColor: Color(0xff444444),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xff444444))),
                    child: const Center(
                      child: CustomText(
                        title: "Report An Issue",
                        fontSize: 15,
                        fontColor: Color(0xff444444),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xff444444))),
                    child: const Center(
                      child: CustomText(
                        title: "Give An Suggestion",
                        fontSize: 15,
                        fontColor: Color(0xff444444),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    isDismissible: true,
  );
}
