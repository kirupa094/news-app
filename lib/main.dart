import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/bloc/base_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BaseBloc bloc = BaseBloc();
  await bloc.getInitData();
  runApp(const App());
}
