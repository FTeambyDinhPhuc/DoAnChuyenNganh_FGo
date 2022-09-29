import 'package:get/get.dart';

import '../views/HomeScreeen.dart';

class RoutesClass{
  static String home="/";

  static List<GetPage> routes =[
    GetPage(name: home, page: ()=>const MyHomePage())
  ];
}