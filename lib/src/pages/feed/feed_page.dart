import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/items_dropdown.dart';
import 'package:home_mobile_application/src/controller/category_controller.dart';
import 'package:home_mobile_application/src/services/post_api.dart';
import 'package:home_mobile_application/src/widgets/category_list.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class FeedPage extends StatelessWidget {
  final postController = Get.put(PostController());
  final categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryList(
            categories: kSubjectList,
          ),
          _buildFeed(),
        ],
      ),
    );
  }

  _buildFeed() => Column(
        children: List.generate(
          20,
          (index) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: QuestionCard(
                  hasImage: index == 1 ? true : false,
                  hasText: index == 1 ? false : true,
                ),
              ),
              Container(
                color: Color(0xFF707070).withOpacity(.25),
                height: 5,
                width: double.infinity,
              ),
            ],
          ),
        ),
      );
}
