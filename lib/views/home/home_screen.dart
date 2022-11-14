import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/views/account/account_screen.dart';
import 'package:fgo/views/booked/booked_screen.dart';
import 'package:fgo/views/history/history_screen.dart';
import 'package:fgo/views/now/now_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _homeController = Get.find<HomeController>();
  var _selectedIndex = 0.obs;

  @override
  void initState() {
    _homeController.getIdCustommer();
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    NowScreen(),
    BookedScreen(),
    HistoryScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: _homeController.idCustommer.value != ''
              ? _widgetOptions.elementAt(_selectedIndex.value)
              : Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
                ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Theme.of(context).primaryColor.withOpacity(0.5),
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
          child: NavigationBar(
            animationDuration: const Duration(milliseconds: 300),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 60,
            selectedIndex: _selectedIndex.value,
            onDestinationSelected: _onItemTapped,
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.toys_outlined),
                  selectedIcon: Icon(Icons.toys),
                  label: 'Now'),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  selectedIcon: Icon(Icons.calendar_month),
                  label: 'booked'),
              NavigationDestination(
                  icon: Icon(Icons.checklist_outlined),
                  selectedIcon: Icon(Icons.checklist),
                  label: 'history'),
              NavigationDestination(
                  icon: Icon(Icons.account_box_outlined),
                  selectedIcon: Icon(Icons.account_box),
                  label: 'account'),
            ],
          ),
        ),
      ),
    );
  }
}
