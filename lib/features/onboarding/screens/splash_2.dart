import 'package:flutter/material.dart';
import 'package:smart_gebere/features/home/screen/home_screen.dart';

import 'onboarding1.dart';

class SplashSecond extends StatefulWidget {
  const SplashSecond({Key? key}) : super(key: key);

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Home()), // Replace MainPage with your desired page
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
