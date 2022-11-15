import 'package:fgo/constants.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/views/booked/components/add_order_button.dart';
import 'package:fgo/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({super.key});

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  var _controller = Get.put(OrderController());
  var _homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    _controller.getBookedOrder(int.parse(_homeController.idCustommer.value));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isLoadingBookedScreen.value
        ? Center(
            child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
          )
        : _controller.bookedOrderList!.length == 0
            ? Stack(children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/bongocat.gif'),
                      Text(
                        'Bạn không có chuyến đi nào!',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
                AddOrderButton(),
              ])
            : RefreshIndicator(
                onRefresh: () async {
                  _controller.getBookedOrder(
                      int.parse(_homeController.idCustommer.value));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultPaddingSmall,
                          bottom: defaultPadding,
                          top: defaultPadding),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Lịch di chuyển',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          ListOrder(
                            list: _controller.bookedOrderList!,
                          ),
                          AddOrderButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
