import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/core/extentions/build_context_extention.dart';
import 'package:connect_app/app/features/auth/domain/providers/auth_providers.dart';
import 'package:connect_app/app/features/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthController = ref.read(authControllerProvider.notifier);
    final formProvider = ref.watch(authFormController);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          context.translate.register,
          style:
              context.textTheme.headlineLarge?.copyWith(color: MyColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyFormFields(formKey: formKey),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    AuthController.register(
                        email: formProvider.email,
                        userName: formProvider.userName,
                        password: formProvider.password);
                  }
                },
                child: Text(context.translate.register)),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  context.translate.googlesignin,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: MyColors.primary_500),
                ))
          ],
        ),
      ),
    );
  }
}
