import 'package:fgo/controllers/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Thông tin sản phẩm:',
            ),
            Obx(() {
              if (_controller.isLoading.value)
                return CircularProgressIndicator();
              else
                return Expanded(
                  child: ListView.builder(
                      itemCount: _controller.productList.length,
                      itemBuilder: (context, index) {
                        return Text(
                          'Title: ${_controller.productList[index].title}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        );
                      }),
                );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
