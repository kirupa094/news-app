import 'package:flutter/material.dart';
import 'package:news_app/util/constant.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressedCallBack;
  const CustomButton(
      {Key? key, required this.title, required this.onPressedCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 48),
          primary: Colors.white,
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        onPressed: () => onPressedCallBack(),
        child: Text(
          title,
          style: const TextStyle(
            color: buttonTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
