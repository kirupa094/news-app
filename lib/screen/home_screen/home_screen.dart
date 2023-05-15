import 'package:flutter/material.dart';
import 'package:news_app/screen/home_screen/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            SearchBar(),
            SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    );
  }
}
