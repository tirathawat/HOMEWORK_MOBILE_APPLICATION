import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Color(0xFFBABABA)),
  );

  final String hint;
  final int maxline;
  final bool enabled;

  CustomTextForm(
      {Key key, @required this.hint, this.maxline = 1, this.enabled = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        maxLines: maxline,
        style: TextStyle(
          fontSize: 20,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabled: enabled,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFFB9B9B9),
          ),
          hintText: hint,
          counterText: "",
          filled: true,
          fillColor: Color(0xFFFBFBFB),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      ),
    );
  }
}
