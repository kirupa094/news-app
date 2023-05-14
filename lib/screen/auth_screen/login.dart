import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/bloc/base_bloc.dart';
import 'package:news_app/bloc/provider.dart';
import 'package:news_app/custom_widget/custom_button.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/custom_widget/custom_textfield.dart';
import 'package:news_app/screen/auth_screen/register.dart';
import 'package:news_app/util/constant.dart';
import 'package:news_app/util/custom_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email = '';
  late String password = '';
  bool showSpinner = false;
  String showError = '';
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late BaseBloc _baseBloc;

  @override
  Widget build(BuildContext context) {
    _baseBloc = Provider.of(context).baseBloc;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
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
                        title: 'Login',
                        onPressedCallBack: () async {
                          if (_form.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              showSpinner = true;
                              showError = '';
                            });
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user.user != null) {
                                final token = await user.user!.getIdToken();
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString("token", token);
                                _baseBloc.setToken(token);
                                
                              }
                            } catch (e) {
                              setState(() {
                                showError = e.toString();
                              });
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: 'New user?',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'nunito',
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              _form.currentState?.reset();
                              setState(() {
                                showError = '';
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const CustomText(
                              text: 'Register',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'nunito',
                              color: secondaryColor,
                            ),
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
      ),
    );
  }
}
