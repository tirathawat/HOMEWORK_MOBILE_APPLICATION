import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/pages/loading/signin_page.dart';

class PromoteAppPage extends StatelessWidget {
  final RxInt _currentPage = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 3,
          ),
          Container(
            height: 400,
            child: PageView(
              onPageChanged: (value) {
                _currentPage.value = value;
              },
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Asset.PROMOTE1_IMAGE,
                      height: 300,
                    ),
                    Spacer(),
                    Text(
                      "Community base for",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6F8597),
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Education",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD75A20),
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Asset.PROMOTE2_IMAGE,
                      height: 300,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Easy",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD75A20),
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          " to ",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F8597),
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Ask",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD75A20),
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "and",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6F8597),
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Answer",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD75A20),
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Asset.PROMOTE3_IMAGE,
                      height: 300,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Free",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD75A20),
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          " to ",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F8597),
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Use",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD75A20),
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => _buildDot(index: index),
            ),
          ),
          Spacer(
            flex: 3,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xFF1B619C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              minimumSize: Size(223, 0),
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            onPressed: () {
              Get.to(SignInPage());
            },
            child: Text(
              "Next",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  _buildDot({int index}) {
    return Obx(
      () => AnimatedContainer(
        margin: EdgeInsets.only(
          right: 5,
        ),
        height: 6,
        width: index == _currentPage.value ? 20 : 6,
        decoration: BoxDecoration(
          color: index == _currentPage.value
              ? Color(0xFF1B619C)
              : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
