import 'package:flutter/material.dart';
import 'package:news_app/bloc/base_bloc.dart';

// InheritedWidget objects have the ability to be
// searched for anywhere 'below' them in the widget tree.
class Provider extends InheritedWidget {
  final BaseBloc baseBloc;

  Provider({Key? key, required Widget child})
      : baseBloc = BaseBloc(),
        super(key: key, child: child);

  @override
  // ignore: avoid_renaming_method_parameters
  bool updateShouldNotify(_) => true;

  // this method is used to access an instance of
  // an inherited widget from lower in the tree.
  // `BuildContext.dependOnInheritedWidgetOfExactType` is a built in
  // Flutter method that does the hard work of traversing the tree for you
  static Provider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!;
  }
}
