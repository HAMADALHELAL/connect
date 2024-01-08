import 'package:connect_app/app/core/extentions/build_context_extention.dart';
import 'package:connect_app/app/features/auth/domain/helper/auth_validators.dart';
import 'package:connect_app/app/features/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<MyFormFields> createState() => _MyFormFieldsState();
}

class _MyFormFieldsState extends State<MyFormFields> {
  final _authValidator = AuthValidators();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode userNameNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    userNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyTextFormField(
                myController: emailController,
                myFocusNode: emailNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.email,
                prefexIcon: const Icon(Icons.email),
                obsecureText: false,
                onChanged: null,
                validator: (value) {
                  return _authValidator.emailValidator(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              MyTextFormField(
                myController: userNameController,
                myFocusNode: userNameNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.userName,
                prefexIcon: const Icon(Icons.abc),
                obsecureText: false,
                onChanged: null,
                validator: (value) {
                  return _authValidator.userNameValidator(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              MyTextFormField(
                myController: passwordController,
                myFocusNode: passwordNode,
                myTextInputAction: TextInputAction.done,
                labelText: context.translate.password,
                prefexIcon: const Icon(Icons.password),
                obsecureText: true,
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                onChanged: null,
                validator: (value) {
                  return _authValidator.passwordVlidator(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
            ],
          ),
        ));
  }
}
