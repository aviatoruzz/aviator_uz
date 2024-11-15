import 'package:aviatoruz/feature/student/home/view/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoDialogRoute(
              builder: (context) => const HomePage(), context: context),
          (route) => false,
        );
      },
    );
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: LottieBuilder.asset(
          fit: BoxFit.cover,
          "assets/images/aviatoruz_splash.json",
        ),
      ),
    );
  }
}
