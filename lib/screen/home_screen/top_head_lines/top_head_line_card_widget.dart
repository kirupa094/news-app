import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/util/constant.dart';

class TopHeadLineCardWidget extends StatelessWidget {
  const TopHeadLineCardWidget({Key? key}) : super(key: key);

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
        image: const DecorationImage(
          image: NetworkImage(
              'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2023%2F05%2FLinda-Yaccarino-Was-Named-Twitter-CEO-and-Apple-Launched-Final-Cut-Pro-and-Logic-Pro-on-iPad-in-This-Weeks-Tech-Roundup-tw.jpg?w=960&cbr=1&q=90&fit=max'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomText(
                text: 'by Ryan Browne',
                fontWeight: FontWeight.w800,
                fontSize: 10,
                fontFamily: 'nunito',
                color: buttonTextColor,
              ),
              CustomText(
                text:
                    'Crypto investors should be prepared to lose all their money, BOE governor says',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: 'new-york',
                color: buttonTextColor,
              ),
            ],
          ),
          const CustomText(
            text:
                '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
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
