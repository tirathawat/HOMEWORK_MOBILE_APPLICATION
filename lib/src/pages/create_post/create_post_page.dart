import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/controller/create_post_controller.dart';
import 'package:home_mobile_application/src/widgets/custom_dropdown.dart';

class CreatePostPage extends StatelessWidget {
  final createPostController = Get.find<CreatePostController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getScreenWidth(13),
            horizontal: getScreenWidth(25),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _buildDropDown(),
              SizedBox(
                height: 10,
              ),
              _buildTextField("Title", createPostController.title),
              SizedBox(
                height: 20,
              ),
              _buildTextField("Description", createPostController.detail),
            ],
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 27,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.withOpacity(.5),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(Asset.FILE_ICON),
              SizedBox(
                width: 27,
              ),
              Text(
                "Attach File",
                style: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 17,
                  color: Color(0xFF929292),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextField _buildTextField(String hint, TextEditingController controller) {
    return TextField(
        controller: controller,
        style: TextStyle(
          fontFamily: "SF Pro",
          fontSize: 17,
          color: Color(0xFF282846),
        ),
        cursorColor: Color(0xFF282846),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 17,
            color: Color(0xFF929292),
          ),
          hintText: hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.1,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.1,
            ),
          ),
        ));
  }

  _buildDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomDropdown(
          chosenValue: createPostController.room,
          hintText: "Subject",
          items: ['Mathematics', 'Physics', 'Biology', 'Chemistry'],
        ),
        CustomDropdown(
          chosenValue: createPostController.level,
          hintText: "Grade",
          items: ['Grade 7', 'Grade 8', 'Grade 9', 'High school'],
        ),
      ],
    );
  }
}
