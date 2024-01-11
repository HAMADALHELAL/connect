import 'package:connect_app/app/core/extentions/build_context_extention.dart';
import 'package:connect_app/app/features/auth/domain/helper/auth_validators.dart';
import 'package:connect_app/app/features/auth/domain/providers/auth_providers.dart';
import 'package:connect_app/app/features/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFormFields extends ConsumerStatefulWidget {
  const MyFormFields({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  ConsumerState<MyFormFields> createState() => _MyFormFieldsState();
}

class _MyFormFieldsState extends ConsumerState<MyFormFields> {
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
    final formProvider = ref.watch(authFormController);
    return Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyTextFormField(
                myController: emailController,
                myFocusNode: emailNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.email,
                prefexIcon: const Icon(Icons.email),
                obsecureText: false,
                onChanged: (value) {
                  formProvider.setEmailField(value);
                },
                validator: (value) {
                  return _authValidator.emailValidator(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              MyTextFormField(
                myController: userNameController,
                myFocusNode: userNameNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.userName,
                prefexIcon: const Icon(Icons.person_2_rounded),
                obsecureText: false,
                onChanged: (value) {
                  formProvider.setUserNameField(value);
                },
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
                obsecureText: formProvider.togglePassword,
                togglePassword: () {
                  formProvider.togglePasswordIcon();
                },
                suffixIcon: Icon(
                  formProvider.togglePassword
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                ),
                onChanged: (value) {
                  formProvider.setPasswordField(value);
                },
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
