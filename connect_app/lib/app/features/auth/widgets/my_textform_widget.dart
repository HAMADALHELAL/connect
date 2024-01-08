import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.myController,
      required this.myFocusNode,
      required this.myTextInputAction,
      required this.labelText,
      required this.prefexIcon,
      this.suffixIcon,
      this.togglePassword,
      required this.obsecureText,
      this.validator,
      required this.onChanged});
  final TextEditingController myController;
  final FocusNode myFocusNode;
  final TextInputAction myTextInputAction;
  final String labelText;
  final Icon prefexIcon;
  final Icon? suffixIcon;
  final Function()? togglePassword;
  final bool obsecureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      focusNode: myFocusNode,
      textInputAction: myTextInputAction,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          label: Text(labelText),
          prefixIcon: prefexIcon,
          suffix: IconButton(
            icon: suffixIcon ?? SizedBox(),
            onPressed: togglePassword,
          )),
      obscureText: obsecureText,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
