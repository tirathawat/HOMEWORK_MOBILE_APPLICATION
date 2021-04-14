import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/pages/loading/promote_app_page.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: PromoteAppPage(),
      backgroundColor: Color(0xFF1B619C),
      title: Text(
        "HOMEWORK",
        style: TextStyle(
          fontFamily: "SF Pro",
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 40,
        ),
      ),
      image: Image.asset(
        Asset.HOMEWORK_LOGO_IMAGE,
      ),
      photoSize: 250,
      loaderColor: Colors.white,
    );
  }
}
