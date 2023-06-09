import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/custom_widget/custom_button.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/custom_widget/custom_textfield.dart';
import 'package:news_app/screen/auth_screen/login.dart';
import 'package:news_app/util/constant.dart';
import 'package:news_app/util/custom_function.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email = '';
  late String password = '';
  late String confirmPassword = '';
  String showError = '';
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
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
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Center(
              child: Form(
                key: _form,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: SingleChildScrollView(
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
                          validator: (value) {
                            if (!CustomFunction.isEmpty(value!)) {
                              return 'Please Enter Email';
                            } else if (!CustomFunction.isValidEmail(value)) {
                              return 'Email format is invalid';
                            }
                            return null;
                          },
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
                          obscureText: true,
                          isPassword: true,
                          textAlign: TextAlign.left,
                          hintText: 'Password',
                          validator: (value) {
                            if (!CustomFunction.isEmpty(value!)) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
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
                          obscureText: true,
                          isPassword: true,
                          textAlign: TextAlign.left,
                          hintText: 'Confirm Password',
                          validator: (value) {
                            if (!CustomFunction.isEmpty(value!)) {
                              return 'Please Enter Password';
                            } else if (confirmPassword != password) {
                              return 'The new password and confirm password do not match. Please try again.';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {
                              confirmPassword = text;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        showError != ''
                            ? CustomText(
                                text: showError,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'nunito',
                                color: textWarning,
                              )
                            : const SizedBox.shrink(),
                        SizedBox(
                          height: showError != '' ? 20 : 0,
                        ),
                        CustomButton(
                          title: 'Register',
                          onPressedCallBack: () async {
                            if (_form.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                showSpinner = true;
                                showError = '';
                              });
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser.additionalUserInfo!.isNewUser) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  });
                                }
                              } catch (e) {
                                setState(() {
                                  showError = e.toString();
                                });
                                print(e);
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
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
          ),
        ),
      ),
    );
  }
}
