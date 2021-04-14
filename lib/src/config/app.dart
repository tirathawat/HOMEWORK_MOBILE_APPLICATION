import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/pages/loading/loading_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOMEWORK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingPage(),
    );
  }
}
