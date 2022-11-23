import 'package:fgo/constants.dart';
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
  var _orderController = Get.put(OrderController());
  var _homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    _orderController
        .getHistoryOrder(int.parse(_homeController.idCustommer.value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPaddingSmall, vertical: defaultPadding),
          child: Text(
            'Lịch sử chuyến đi',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Obx(() => _orderController.isLoadingHistoryScreen.value
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
                ),
              )
            : _orderController.historyOrderList!.length == 0
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/image_no_order.png'),
                          Text(
                            'Bạn không có lịch sử!',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _orderController.getHistoryOrder(
                            int.parse(_homeController.idCustommer.value));
                      },
                      child: ListOrder(
                        list: _orderController.historyOrderList!,
                      ),
                    ),
                  )),
      ],
    );
  }
}
