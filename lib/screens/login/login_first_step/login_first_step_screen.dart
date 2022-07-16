import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/screens/login/login_secound_step/login_secound_step_screen.dart';
import 'package:open_sooq/utils/shared_widgets/custom_button.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginFirstStepScreen extends StatelessWidget {
  const LoginFirstStepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/logo.png",
              scale: 8,
            ),
            const SizedBox(height: 80),
            Image.asset("assets/images/login_1.png"),
            Expanded(child: Container()),
            const CustomText(
              title: "Login",
              fontSize: 14,
              fontColor: Color(0xff444444),
            ),
            const CustomText(
              title: "this is the first page for login",
              fontSize: 12,
              fontColor: Color(0xffBFBFBF),
            ),
            const SizedBox(height: 20),
            CustomButton(
                buttonTitle: "SIGN IN / REGESTER",
                enableButton: true,
                onTap: () {
                  Get.to(() => LoginSecoundStepScreen());
                }),
            const CustomText(
              title:
                  "By clicking \"SIGN IN / REGISTER\" you will be agreed to the",
              fontSize: 12,
              fontColor: Color(0xff444444),
            ),
            TextButton(
              onPressed: () async {
                var url = "https://www.talabat.com/jordan/terms";

                if (!await launchUrl(Uri.parse(url))) {
                  throw 'Could not launch $url';
                }
              },
              child: const CustomText(
                title: "Terms & Conditions",
                fontSize: 12,
                fontColor: Color(0xff4CB6EA),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const CustomText(
                    title: "Skip",
                    fontSize: 15,
                    fontColor: Color(0xff4CB6EA),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
