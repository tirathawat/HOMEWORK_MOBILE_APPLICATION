import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  RxString room = ''.obs;
  RxString level = ''.obs;
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();

  void clear() {
    title.clear();
    detail.clear();
  }
}
