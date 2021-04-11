import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/controller/category_controller.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;
  final categoryController = Get.find<CategoryController>();

  CategoryList({Key key, @required this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: getScreenWidth(16),
        bottom: 20,
      ),
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              categoryController.currentIndex.value = index;
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: index == 0 ? 0 : 10,
                right: index == categories.length - 1 ? 10 : 0,
              ),
              child: Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: categoryController.currentIndex.value == index
                        ? Color(0xFFD75A20)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    border: Border.all(
                      color: Color(0xFFD75A20),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      categories[index],
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: categoryController.currentIndex.value == index
                            ? Colors.white
                            : Color(0xFFD75A20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
