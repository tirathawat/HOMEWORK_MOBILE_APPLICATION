import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/widgets/custom_dropdown.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDropDown(),
          // QuestionCard(

          // ),
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
            hintText: "Subject",
            items: [
              'All Subject',
              'Mathematics',
              'Physics',
              'Biology',
              'Chemistry'
            ],
          ),
          CustomDropdown(
            hintText: "Grade",
            items: [
              'All Grade',
              'Grade 7',
              'Grade 8',
              'Grade 9',
              'High school'
            ],
          ),
          CustomDropdown(
            hintText: "Sort By",
            items: [
              'Grade',
              'Date',
              'Like',
            ],
          ),
        ],
      ),
    );
  }
}
