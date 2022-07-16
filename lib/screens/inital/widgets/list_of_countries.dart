import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:open_sooq/models/http_models/countries_response.dart';
import 'package:open_sooq/screens/main_container/main_container_screen.dart';
import 'package:open_sooq/utils/hive_constant.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class ListOfCountries extends StatelessWidget {
  final List<Countries>? listOfCountries;
  final String selectedLanguage;

  const ListOfCountries(
      {required this.listOfCountries, required this.selectedLanguage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: listOfCountries == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : listOfCountries!.isNotEmpty
              ? ListView.builder(
                  itemCount: listOfCountries!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              final myBox =
                                  Hive.box(DatabaseBoxConstant.storage);
                              await myBox.put(DatabaseFieldConstant.language,
                                  selectedLanguage);
                              await myBox.put(DatabaseFieldConstant.countryId,
                                  listOfCountries![index].id.toString());

                              Get.off(() => MainContainerScreen());
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: FadeInImage(
                                    placeholder: const AssetImage(
                                        "assets/images/flag_placeholder.png"),
                                    image: NetworkImage(
                                        listOfCountries![index].flagImage!,
                                        scale: 1),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomText(
                                    title: listOfCountries![index].name!,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontColor: Colors.black,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(
                  child: CustomText(
                    title: "No Item to show",
                    fontSize: 15,
                    fontColor: Colors.black,
                  ),
                ),
    );
  }
}
