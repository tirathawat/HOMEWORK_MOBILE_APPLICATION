import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final RxString _chosenValue = ''.obs;

  final String initialValue;
  final List<String> items;
  final String hintText;

  CustomDropdown(
      {Key key, this.initialValue, @required this.items, this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (hintText != null)
      _chosenValue.value = null;
    else
      _chosenValue.value = initialValue;
    return Obx(
      () => DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            style: TextStyle(fontSize: 14, color: Colors.black),
            hint: Text(
              hintText ?? "",
              style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
            ),
            icon: Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            value: _chosenValue.value,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              _chosenValue.value = value;
            },
          ),
        ),
      ),
    );
  }
}
