import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/util/constant.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String url;
  final DateTime publishAt;
  final String title;
  final String content;
  final String author;
  const NewsDetailsScreen(
      {Key? key,
      required this.url,
      required this.publishAt,
      required this.title,
      required this.content,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    const double containerHeight = 140;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(245, 245, 245, 0.5),
                ),
                width: 35,
                height: 45,
                child: const Center(
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 10,
                          top: 50,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          color: buttonTextColor,
                        ),
                        child: CustomText(
                          text: content,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'nunito',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenSize.height * 0.31,
                left: screenSize.width * 0.1,
                right: screenSize.width * 0.1,
                height: containerHeight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(245, 245, 245, 0.7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: DateFormat('EEEE, d MMMM yyyy').format(publishAt),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: 'nunito',
                        color: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        text: title,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'new-york',
                        color: Colors.black,
                      ),
                      const Spacer(),
                      CustomText(
                        text: 'Published by $author',
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        fontFamily: 'nunito',
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: primaryColor,
            child: const Icon(Icons.favorite),
          ),
        ),
      ),
    );
  }
}
