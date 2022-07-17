import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/screens/login/login_secound_step/login_secound_step_bloc.dart';
import 'package:open_sooq/screens/login/login_third_step/login_third_step_screen.dart';
import 'package:open_sooq/utils/logger.dart';
import 'package:open_sooq/utils/shared_widgets/custom_button.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class LoginSecoundStepScreen extends StatelessWidget {
  LoginSecoundStepScreen({Key? key}) : super(key: key);

  String countryCode = "962";

  TextEditingController controller = TextEditingController();
  final bloc = LoginSecoundStepBloc();

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
                    ),
                  ),
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
              Image.asset("assets/images/login_2.png"),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                title: "Enter your phone Number in the field below",
                fontSize: 12,
                fontColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 54,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    CountryPickerDropdown(
                      iconSize: 16,
                      initialValue: 'JO',
                      itemBuilder: _buildDropdownItem,
                      // itemFilter:  ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
                      priorityList: [
                        CountryPickerUtils.getCountryByIsoCode('GB'),
                        CountryPickerUtils.getCountryByIsoCode('CN'),
                      ],
                      sortComparator: (Country a, Country b) =>
                          a.isoCode.compareTo(b.isoCode),
                      onValuePicked: (Country country) {
                        countryCode = country.phoneCode;

                        print("${country.name}");
                      },
                    ),
                    const SizedBox(width: 6),
                    VerticalDivider(
                      color: Colors.grey[900],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 245,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black54),
                          hintText: "Your mobile number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  buttonTitle: "Verify",
                  enableButton: controller.text == "" ? false : true,
                  onTap: () {
                    bloc
                        .callRequest(mobileNumber: controller.text)
                        .then((value) {
                      logger.wtf("value.data!.lastOtp");
                      logger.wtf(value.data!.lastOtp);
                      print(value.data!.id!);

                      Get.to(() => LoginThirdScreen(
                            countryCode: countryCode,
                            mobileNumber: controller.text,
                            hamodehapikey: value.data!.apiKey!,
                            userid: value.data!.id!,
                          ));
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 8.0,
          ),
          Text("+${country.phoneCode}"),
        ],
      );
}
