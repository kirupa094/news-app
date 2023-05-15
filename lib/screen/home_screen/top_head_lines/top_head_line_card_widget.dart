import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/util/constant.dart';

class TopHeadLineCardWidget extends StatelessWidget {
  final String url;
  final String author;
  final String description;
  final String title;
  const TopHeadLineCardWidget(
      {Key? key,
      required this.url,
      required this.author,
      required this.description,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(98, 98, 98, 0.35),
            Color(0xFF000000),
          ],
          stops: [0.5, 0.997],
        ),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'by $author',
                fontWeight: FontWeight.w800,
                fontSize: 10,
                fontFamily: 'nunito',
                color: buttonTextColor,
              ),
              CustomText(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: 'new-york',
                color: buttonTextColor,
              ),
            ],
          ),
          CustomText(
            text: description,
            fontWeight: FontWeight.w400,
            fontSize: 10,
            fontFamily: 'nunito',
            color: buttonTextColor,
          ),
        ],
      ),
    );
  }
}
