import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/screen/home_screen/top_head_lines/top_head_line_builder.dart';
import 'package:news_app/screen/home_screen/top_head_lines/top_head_line_card_widget.dart';
import 'package:news_app/util/constant.dart';

class TopHeadLinesNews extends StatelessWidget {
  const TopHeadLinesNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: 'Latest News',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: 'new-york',
              color: Colors.black,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'See All',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'nunito',
                  color: secondaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, color: secondaryColor),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: const TopHeadLineBuilder(),
        )
      ],
    );
  }
}
