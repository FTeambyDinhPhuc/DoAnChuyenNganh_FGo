import 'package:fgo/bindings/add_order_binding.dart';
import 'package:fgo/bindings/home_binding.dart';
import 'package:fgo/bindings/login_binding.dart';
import 'package:fgo/bindings/register_binding.dart';
import 'package:fgo/bindings/splash_binging.dart';
import 'package:fgo/views/addorder/add_order_screen.dart';
import 'package:fgo/views/changepassword/change_password_screen.dart';
import 'package:fgo/views/home/home_screen.dart';
import 'package:fgo/views/register/register_screen.dart';
import 'package:fgo/views/selectlogin/select_login_screen.dart';
import 'package:fgo/views/loginwithphonenumber/login_with_phonenumber_screen.dart';
import 'package:fgo/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = "/";
  static String splash = "/splash";
  static String login = "/login";
  static String loginWithPhoneNumber = "/loginwithphonenumber";
  static String register = "/register";
  static String addOrder = "/addorder";
  static String changePassword = "/changepassword";

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: home,
        page: () => const MyHomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: login,
        page: () => const Login(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: loginWithPhoneNumber,
        page: () => const LoginWithPhoneNumber(),
        binding: LoginBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: register,
        page: () => Register(),
        binding: RegisterBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: addOrder,
        page: () => AddOrderScreen(),
        binding: AddOrderBinding(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: changePassword,
        page: () => ChangePassword(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
  ];
}
