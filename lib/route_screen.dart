import 'package:flutter/material.dart';
import 'package:news_app/bloc/base_bloc.dart';
import 'package:news_app/bloc/provider.dart';
import 'package:news_app/screen/auth_screen/login.dart';
import 'package:news_app/screen/home_screen/home_screen.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBloc = Provider.of(context).baseBloc;
    return StreamBuilder(
      stream: baseBloc.initDataConfig,
      builder: (context, AsyncSnapshot<InitData> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.token != '') {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
