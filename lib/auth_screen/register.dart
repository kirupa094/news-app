import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/custom_button.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/custom_widget/custom_textfield.dart';
import 'package:news_app/util/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email = '';
  late String password = '';
  late String confirmPassword = '';
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Icons.newspaper,
                    color: secondaryColor,
                    size: 45,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: 'Welcome to News App...!',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'nunito',
                    color: Colors.black,
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
                  CustomTextFieldWidget(
                    isPassword: true,
                    textAlign: TextAlign.left,
                    hintText: 'Confirm Password',
                    validator: (value) {},
                    onChanged: (text) {
                      setState(() {
                        confirmPassword = text;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'Register',
                    onPressedCallBack: () => {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: const CustomText(
                      text: 'Back to Login',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'nunito',
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
