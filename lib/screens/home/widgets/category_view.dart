import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/models/categories.dart';
import 'package:open_sooq/screens/filter/filter_screen.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';

class HomeCategoryView extends StatelessWidget {
  List<Categories> listOfCategories;
  HomeCategoryView({required this.listOfCategories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listOfCategories.length ~/ 2,
          itemBuilder: (cotext, index) {
            return Column(
              children: [
                _categoryIcon(listOfCategories[index]),
                _categoryIcon(listOfCategories[index + 6]),
              ],
            );
          }),
    );
  }

  Widget _categoryIcon(Categories item) {
    return InkWell(
      onTap: () {
        if (item.name == "All") {
          Get.to(() => FilterScreen(listOfCategories: listOfCategories));
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              width: 90,
              height: 90,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: const Color(0xff444444),
                        borderRadius: BorderRadius.circular(25)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox.fromSize(
                        child: Image.network(item.image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomText(
                    title: item.name,
                    fontSize: 15,
                    fontColor: Colors.black87,
                  ),
                ],
              ),
            ),
          ),
          item.badge != null
              ? Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: CustomText(title: "New", fontSize: 10),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
