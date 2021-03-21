import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/widgets/custom_dropdown.dart';
import 'package:home_mobile_application/src/widgets/custom_textform.dart';

class CreatePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getScreenWidth(13),
          horizontal: getScreenWidth(25),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomTextForm(hint: "Title"),
            SizedBox(
              height: 10,
            ),
            _buildDropDown(),
            SizedBox(
              height: 10,
            ),
            CustomTextForm(
              hint: "Description",
              maxline: 9,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: getScreenWidth(190)),
              child: CustomTextForm(
                enabled: false,
                hint: "Image",
                maxline: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDropDown() {
    return Row(
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
          items: ['All Grade', 'Grade 7', 'Grade 8', 'Grade 9', 'High school'],
        ),
      ],
    );
  }
}
