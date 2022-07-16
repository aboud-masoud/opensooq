import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/models/categories.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';
import 'package:open_sooq/utils/shared_widgets/my_appbar.dart';

class FilterScreen extends StatelessWidget {
  final List<Categories> listOfCategories;
  const FilterScreen({required this.listOfCategories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(
        context,
        "Filter",
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[600],
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async => await cittiesButtomSheet(context),
                  child: const CustomText(
                    title: "City",
                    fontSize: 20,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () async => await categoriesButtomSheet(context),
                  child: const CustomText(
                    title: "Categories",
                    fontSize: 20,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> categoriesButtomSheet(BuildContext context) async {
    ValueNotifier<bool> selectedIndexNotifier = ValueNotifier<bool>(false);
    List<int> selectedIndex = [];

    return await Get.bottomSheet(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
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
              height: MediaQuery.of(context).size.height * 0.75 - 145,
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
                      title: "Categories",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontColor: Color(0xff444444),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: ListView.builder(
                          itemCount: listOfCategories.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (index == 0) {
                                  for (int x = 0;
                                      x < listOfCategories.length;
                                      x++) {
                                    selectedIndex.add(x);
                                  }
                                } else {
                                  selectedIndex.add(index);
                                }

                                selectedIndexNotifier.value =
                                    !selectedIndexNotifier.value;
                              },
                              child: SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    CustomText(
                                      title: listOfCategories[index].name,
                                      fontSize: 20,
                                      fontColor: const Color(0xff444444),
                                    ),
                                    Expanded(child: Container()),
                                    ValueListenableBuilder<bool>(
                                        valueListenable: selectedIndexNotifier,
                                        builder: (context, snapshot, lolo) {
                                          return Icon(selectedIndex
                                                  .contains(index)
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank);
                                        })
                                  ],
                                ),
                              ),
                            );
                          }),
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

  Future<Widget> cittiesButtomSheet(BuildContext context) async {
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
}
