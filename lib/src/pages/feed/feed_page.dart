import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/services/post_api.dart';
import 'package:home_mobile_application/src/widgets/custom_dropdown.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class FeedPage extends StatelessWidget {
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDropDown(),
          _buildFeed(),
        ],
      ),
    );
  }

  _buildDropDown() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getScreenWidth(13),
        horizontal: getScreenWidth(25),
      ),
      child: Row(
        children: [
          CustomDropdown(
            initialValue: "All Subject",
            items: [
              'All Subject',
              'Mathematics',
              'Physics',
              'Biology',
              'Chemistry'
            ],
          ),
          SizedBox(
            width: getScreenWidth(25),
          ),
          CustomDropdown(
            initialValue: "All Grade",
            items: [
              'All Grade',
              'Grade 7',
              'Grade 8',
              'Grade 9',
              'High school'
            ],
          ),
        ],
      ),
    );
  }

  _buildFeed() => Obx(
        () {
          if (postController.post.value == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return RefreshIndicator(
            onRefresh: () async {
              await postController.getPost();
            },
            child: Container(
              width: double.infinity,
              height: Get.height - 300,
              child: ListView(
                children: List.generate(
                  postController.post.value.length,
                  (index) => QuestionCard(
                    post: postController.post.value[index],
                  ),
                ),
              ),
            ),
          );
        },
      );
}
