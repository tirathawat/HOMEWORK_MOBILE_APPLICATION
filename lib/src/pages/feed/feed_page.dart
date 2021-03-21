import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/widgets/custom_dropdown.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class FeedPage extends StatelessWidget {
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

  _buildFeed() => Column(
        children: List.generate(
            10,
            (index) => index == 0 || index == 5
                ? QuestionCard(
                    isCheck: true,
                  )
                : QuestionCard()),
      );
}
