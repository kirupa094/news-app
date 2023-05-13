import 'package:flutter/material.dart';
import 'package:news_app/auth_screen/login.dart';
import 'package:news_app/route_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
