import 'package:fgo/constants.dart';
import 'package:fgo/controllers/splash_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _splashController = Get.find<SplashController>();
  @override
  void initState() {
    super.initState();
    _splashController.getDataApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                primaryColor,
                blueColor,
              ]),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/image_splash.png",
                    height: 300.0,
                    width: 300.0,
                  ),
                  Text("Wellcome to FGo\n Need a car for amazing weekends?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white)),
                ],
              ),
              CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blue.shade200))
            ]),
      ),
    );
  }
}
