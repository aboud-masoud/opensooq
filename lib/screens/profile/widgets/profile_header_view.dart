import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/screens/login/login_first_step/login_first_step_screen.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class ProfileHeaderView extends StatelessWidget {
  const ProfileHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/images/avatar.jpg"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomText(
                      title: "Hello Guest !",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const LoginFirstStepScreen()),
                        child: const CustomText(
                          title: "Login",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const CustomText(
                          title: "open shop",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
          Container(
            height: 2,
            color: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttomView("Ads", "0"),
                buttomView("Views", "0"),
                buttomView("Credit", "0"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buttomView(String title, String value) {
    return Column(
      children: [
        CustomText(
          title: value,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontColor: Colors.black,
        ),
        CustomText(
          title: title,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontColor: Colors.black26,
        ),
      ],
    );
  }
}
