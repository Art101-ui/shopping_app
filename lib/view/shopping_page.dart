// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_page/controller/cart_controller.dart';
import 'package:shopping_page/controller/shopping_controller.dart';

// ignore: use_key_in_widget_constructors
class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 49, 207),
        title: Text(
          'Shopping Page',
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .products[index].productName,
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                          controller.products[index]
                                              .productDescription,
                                          style: const TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '\$${controller.products[index].price}',
                                      style: const TextStyle(fontSize: 24),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                  child: const Text('ADD TO CART'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 183, 49, 207)),
                                onPressed: () {
                                  cartController
                                      .addcart(controller.products[index]);
                                },
                                )
                              ],
                            ),
                          ));
                    },
                  );
                }),
              ),
            GetX<CartController>(builder: (controller) {
              return Text('Total Amount: \$ ${controller.totalPrice}',
                  style: const TextStyle(color: Colors.white));
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed('/cart'),
        backgroundColor: Colors.purple,
        icon: const Icon(
          Icons.add_shopping_cart_rounded,
          // color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            '${controller.count}',
            style: const TextStyle(fontSize: 24),
          );
        }),
      ),
    );
  }
}
