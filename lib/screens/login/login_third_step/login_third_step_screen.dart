import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/screens/login/login_fourth-step/login_fourth_step_screen.dart';
import 'package:open_sooq/screens/login/login_secound_step/login_secound_step_bloc.dart';
import 'package:open_sooq/utils/shared_widgets/custom_button.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class LoginThirdScreen extends StatefulWidget {
  const LoginThirdScreen(
      {Key? key,
      required this.countryCode,
      required this.mobileNumber,
      required this.hamodehapikey,
      required this.userid})
      : super(key: key);
  final String countryCode;
  final String mobileNumber;
  final String hamodehapikey;
  final int userid;

  @override
  State<LoginThirdScreen> createState() => _LoginThirdScreenState();
}

class _LoginThirdScreenState extends State<LoginThirdScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _start = 15;

  bool otpNotValid = false;

  final bloc = LoginSecoundStepBloc();

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
                    if (value.length == 6) {
                      bloc
                          .callverifyrequset(
                              mobileNumber: widget.mobileNumber,
                              otp: value,
                              apiKey: widget.hamodehapikey,
                              userId: widget.userid)
                          .then((value) {
                        if (value.data != null) {
                          otpNotValid = false;

                          print(value.data!.token);
                          Get.to(() => const LoginFourthScreen());
                        } else {
                          otpNotValid = true;
                          print("OTP Is Not Valid");
                          setState(() {});
                        }
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              otpNotValid
                  ? const CustomText(
                      title: "OTP Is Not Valid",
                      fontSize: 20,
                      fontColor: Colors.red,
                    )
                  : Container(),
              const SizedBox(height: 50),
              _start == 0
                  ? CustomButton(
                      buttonTitle: "Resend Code",
                      enableButton: true,
                      onTap: () async {
                        await bloc
                            .callRequest(mobileNumber: widget.mobileNumber)
                            .then((value) {
                          _start = 15;
                          startTimer();
                          print(value.data!.lastOtp);
                          setState(() {});
                        });
                      }

                      //TODO
                      //  Get.to(() => const LoginFirstStepScreen());
                      )
                  : CustomText(
                      title:
                          _start > 9 ? "00:$_start شغل نظيف " : "00:0$_start",
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
