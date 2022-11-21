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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPaddingSmall, vertical: defaultPadding),
          child: Text(
            'Lịch di chuyển',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Obx(() => _controller.isLoadingBookedScreen.value
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
                ),
              )
            : _controller.bookedOrderList!.length == 0
                ? Stack(children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/image_no_order.png'),
                            Text(
                              'Bạn không có chuyến đi nào!',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AddOrderButton(),
                  ])
                : Expanded(
                    child: Stack(
                      children: [
                        RefreshIndicator(
                          onRefresh: () async {
                            _controller.getBookedOrder(
                                int.parse(_homeController.idCustommer.value));
                          },
                          child: ListOrder(
                            list: _controller.bookedOrderList!,
                          ),
                        ),
                        AddOrderButton(),
                      ],
                    ),
                  )),
      ],
    );
  }
}
