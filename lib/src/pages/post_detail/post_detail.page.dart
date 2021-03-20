import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class PostDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFDFF),
      appBar: _buildAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          QuestionCard(
            isCheck: true,
          )
        ],
      ))),
    );
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.bookmark_outline),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Icon(Icons.more_vert),
          ),
        ],
      );
}
