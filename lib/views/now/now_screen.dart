import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/controllers/location_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/views/now/components/google_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NowScreen extends StatefulWidget {
  const NowScreen({super.key});

  @override
  State<NowScreen> createState() => _NowScreenState();
}

class _NowScreenState extends State<NowScreen> {
  var _locationController = Get.put(LocationController());
  var _orderController = Get.put(OrderController());
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _orderController.getStartingOrder(int.parse(_homeController.idCustommer),
        DateFormat("dd-MM-yyyy").format(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _orderController.isLoadingNowScreen.value
        ? Center(
            child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
          )
        : _orderController.startingOrderList!.length == 0
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/image_no_order.png'),
                    Text(
                      'Hôm nay bạn không có lịch!',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              )
            : GoogleMapScreen(
                orderController: _orderController,
                locationController: _locationController));
  }
}
