import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var _controller = Get.put(OrderController());
  var _homeController = Get.find<HomeController>();
  @override
  void initState() {
    _controller.getHistoryOrder(int.parse(_homeController.idCustommer.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lịch sử chuyến đi',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: Obx(
        () => _controller.isLoadingHistoryScreen.value
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
              )
            : _controller.historyOrderList!.length == 0
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/bongocat.gif'),
                        Text(
                          'Bạn không có lịch sử!',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  )
                : Stack(
                    children: [
                      ListOrder(
                        list: _controller.historyOrderList!,
                      ),
                    ],
                  ),
      ),
    );
  }
}
