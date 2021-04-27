import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final RxString chosenValue;

  final String initialValue;
  final List<String> items;
  final String hintText;

  CustomDropdown(
      {Key key,
      this.initialValue,
      @required this.items,
      this.hintText,
      @required this.chosenValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (hintText != null)
      chosenValue.value = null;
    else
      chosenValue.value = initialValue;
    return Obx(
      () => DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            style: TextStyle(
                fontFamily: "SF Pro", fontSize: 17, color: Colors.black),
            hint: Text(
              hintText ?? "",
              style: TextStyle(
                  fontFamily: "SF Pro", fontSize: 17, color: Color(0xFF6D6D6D)),
            ),
            icon: Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            value: chosenValue.value,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              chosenValue.value = value;
            },
          ),
        ),
      ),
    );
  }
}
