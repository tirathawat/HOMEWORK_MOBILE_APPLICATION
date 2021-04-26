import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/services/post_api.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class SearchResultPage extends StatelessWidget {
  final String searchStr;
  final PostController postController = Get.find<PostController>();
  SearchResultPage({Key key, @required this.searchStr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(Asset.SORT_ICON),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sort by Lastest",
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF282846),
                    ),
                  ),
                ],
              ),
            ),
            _buildFeed(),
          ],
        ),
      ),
    );
  }

  _buildFeed() => Column(
        children: List.generate(
          3,
          (index) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: QuestionCard(
                  post: postController.post.value[0],
                ),
              ),
              Container(
                color: Color(0xFF707070).withOpacity(.25),
                height: 5,
                width: double.infinity,
              ),
            ],
          ),
        ),
      );

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Color(0xFF282846), //change your color here
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            "Result of ",
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF282846).withOpacity(.8),
            ),
          ),
          Flexible(
            child: Text(
              "'$searchStr'",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF282846),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
