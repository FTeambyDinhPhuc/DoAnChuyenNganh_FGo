import 'package:fgo/views/signed/login_screen.dart';
import 'package:fgo/views/splash_screen.dart';
import 'package:get/get.dart';

import '../views/home_screen.dart';

class RoutesClass{
  static String home="/";
  static String splash="/splash";
  static String login="/login";

  static List<GetPage> routes =[
    GetPage(name: splash, page: ()=>const SplashScreen()),
    GetPage(name: home, page: ()=>const MyHomePage(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 700)),
    GetPage(name: login, page: ()=>const Login(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 700)),
  ];
}