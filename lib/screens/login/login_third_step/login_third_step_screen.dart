import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/screens/login/login_fourth-step/login_fourth_step_screen.dart';
import 'package:open_sooq/utils/shared_widgets/custom_button.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class LoginThirdScreen extends StatefulWidget {
  const LoginThirdScreen(
      {Key? key, required this.countryCode, required this.mobileNumber})
      : super(key: key);
  final String countryCode;
  final String mobileNumber;

  @override
  State<LoginThirdScreen> createState() => _LoginThirdScreenState();
}

class _LoginThirdScreenState extends State<LoginThirdScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            //sawee ale bdk ayaaah
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.black,
                      )),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/login_3.png"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  maxLength: 6,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black54),
                    hintText: "Your OTP Code",
                  ),
                  onSubmitted: (value) {
                    if (value.length == 5) {
                      Get.to(() => const LoginFourthScreen());
                    }
                  },
                ),
              ),
              const SizedBox(height: 50),
              _start == 0
                  ? CustomButton(
                      buttonTitle: "Resend Code",
                      enableButton: true,
                      onTap: () {
                        //TODO
                        //  Get.to(() => const LoginFirstStepScreen());
                      })
                  : CustomText(
                      title: "00:$_start",
                      fontSize: 18,
                      fontColor: _start <= 10 ? Colors.red : Colors.green,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
