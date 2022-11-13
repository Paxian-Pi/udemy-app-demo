import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 0;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      _height = MediaQuery.of(context).size.height;
      setState(() {});
    });

    Timer(const Duration(milliseconds: 5500), () {
      Get.offAll(
        () => const MainScreen(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.rightToLeft,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/splash.jpg'),
                ),
              ),
            ),
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 0,
            //   child: Column(
            //     children: [
            //       AnimatedContainer(
            //         duration: const Duration(milliseconds: 1500),
            //         height: _height,
            //         curve: Curves.bounceInOut,
            //         child: Center(
            //           child: Image.asset(
            //             'assets/football.png',
            //             key: UniqueKey(),
            //             width: 120,
            //             height: 120,
            //           ),
            //         ),
            //       ),
            //       Center(
            //         child: Image.asset(
            //           'assets/quizza_200.png',
            //           key: UniqueKey(),
            //           width: 200,
            //           height: 200,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
