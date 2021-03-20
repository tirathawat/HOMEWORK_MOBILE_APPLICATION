import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';

class CustomDropdown extends StatelessWidget {
  final RxString _chosenValue = ''.obs;

  final String initialValue;
  final List<String> items;

  CustomDropdown({Key key, @required this.initialValue, @required this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    _chosenValue.value = initialValue;
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Transform.rotate(
            angle: pi / 2,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
          value: _chosenValue.value,
          items: items.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (value) {
            _chosenValue.value = value;
          },
        ),
      ),
    );
  }
}
