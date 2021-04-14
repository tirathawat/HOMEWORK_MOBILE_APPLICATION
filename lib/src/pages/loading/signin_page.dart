import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/pages/home/home_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 70,
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                Asset.HOMEWORK_LOGO_IMAGE,
              ),
              Spacer(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xFF1B619C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  minimumSize: Size(double.infinity, 0),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Get.offAll(HomePage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Asset.GOOGLE_ICON),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Login with Google",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
