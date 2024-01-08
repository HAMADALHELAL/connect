import 'package:connect_app/app/core/extentions/build_context_extention.dart';
import 'package:connect_app/app/features/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.translate.register),
      ),
      body: Column(
        children: [MyFormFields(formKey: formKey)],
      ),
    );
  }
}
