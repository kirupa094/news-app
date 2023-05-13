import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_button.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/custom_widget/custom_textfield.dart';
import 'package:news_app/util/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email = '';
  late String password = '';
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _form,
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock,
                      color: secondaryColor,
                      size: 45,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldWidget(
                      isPassword: false,
                      textAlign: TextAlign.left,
                      hintText: 'Email',
                      validator: (value) {},
                      onChanged: (text) {
                        setState(() {
                          email = text;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldWidget(
                      isPassword: true,
                      textAlign: TextAlign.left,
                      hintText: 'Password',
                      validator: (value) {},
                      onChanged: (text) {
                        setState(() {
                          password = text;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: 'Login',
                      onPressedCallBack: () => {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CustomText(
                          text: 'New user?',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: '',
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: 'Register',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: '',
                          color: secondaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
