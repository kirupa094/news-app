import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/util/constant.dart';
import 'package:intl/intl.dart';

class SearchCardWidget extends StatelessWidget {
  final String title;
  final String author;
  final DateTime publishAt;
  final String url;
  const SearchCardWidget(
      {Key? key,
      required this.title,
      required this.author,
      required this.publishAt,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(98, 98, 98, 0.35),
            Colors.black,
          ],
          stops: [0.5, 1.0],
        ),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: 'new-york',
            color: buttonTextColor,
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: author,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: 'nunito',
                color: buttonTextColor,
              ),
              CustomText(
                text: DateFormat('EEEE, d MMMM yyyy').format(publishAt),
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: 'nunito',
                color: buttonTextColor,
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
