import 'package:flutter/material.dart';
import 'package:news_app/util/constant.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final TextAlign textAlign;
  final bool isPassword;
  const CustomTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    required this.textAlign,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      cursorColor: labelTextColor,
      obscureText: obscureText,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        errorMaxLines: 3,
        errorStyle: const TextStyle(fontSize: 12, height: 1),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 14,
        ),
        suffixIconColor: visibilityIconColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  color: visibilityIconColor,
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        filled: true,
        fillColor: loginWidgetColor,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: labelTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'nunito',
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: textWarning,
            )),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(
            color: textWarning,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
