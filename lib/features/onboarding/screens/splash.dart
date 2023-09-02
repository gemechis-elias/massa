import 'package:flutter/material.dart';

import 'onboarding1.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const OnBoardingScreen()), // Replace MainPage with your desired page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            // child: Container(
            //   width: 230,
            //   height: 91,
            //   margin: const EdgeInsets.only(bottom: 50),
            //   child: Image.asset('assets/images/logo.png'),
            // ),
            ),
      ),
    );
  }
}
