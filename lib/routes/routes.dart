import 'package:fgo/views/addorder/add_order_screen.dart';
import 'package:fgo/views/home/home_screen.dart';
import 'package:fgo/views/selectlogin/select_login_screen.dart';
import 'package:fgo/views/loginwithphonenumber/login_with_phonenumber_screen.dart';
import 'package:fgo/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = "/";
  static String splash = "/splash";
  static String login = "/login";
  static String loginWithPhoneNumber = "/loginwithphonenumber";
  static String addOrder = "/addorder";

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
        name: home,
        page: () => const MyHomePage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: login,
        page: () => const Login(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: loginWithPhoneNumber,
        page: () => const LoginWithPhoneNumber(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: addOrder,
        page: () => AddOrderScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300)),
  ];
}
