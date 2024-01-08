import 'package:connect_app/app/config/routes/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: GestureDetector(
          child: Text("GGEZ"),
          onTap: () {
            context.pushNamed(MyNamedRoutes.register);
          },
        )),
      ),
    );
  }
}
