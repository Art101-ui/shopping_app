import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_page/controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 49, 207),
        title: Text(
          'Cart Page',
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: GetX<CartController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                      // color: const Color.fromARGB(255, 22, 184, 119),
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cartItems[index].productName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      controller
                                          .cartItems[index].productDescription,
                                      style: const TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                                Text(
                                  '\$${controller.cartItems[index].price}',
                                  style: const TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            ElevatedButton(
                              child: const Text('BUY'),
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 183, 49, 207)),
                              onPressed: () {
                                Get.snackbar('Successful',
                                    'You have bought ${controller.cartItems[index].productName}',
                                    backgroundColor: Colors.white,
                                    colorText: Colors.green);
                              },
                            )
                          ],
                        ),
                      ));
                },
              );
            }),
          ),
        ],
      )),
    );
  }
}
