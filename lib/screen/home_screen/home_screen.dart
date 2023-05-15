import 'package:flutter/material.dart';
import 'package:news_app/screen/home_screen/searchbar.dart';
import 'package:news_app/screen/home_screen/top_head_lines/top_head_lines.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 40),
          child: Column(
            children: const [
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              TopHeadLinesNews()
            ],
          ),
        ),
      ),
    );
  }
}
