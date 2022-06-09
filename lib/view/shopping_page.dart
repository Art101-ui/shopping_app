// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_page/controller/shopping_controller.dart';

// ignore: use_key_in_widget_constructors
class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final ShoppingController shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 39, 39, 39),
        body: SafeArea(         
      child: Column(
        children: [
          Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
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
                                      primary: const Color.fromARGB(
                                          255, 3, 201, 181)),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ));
                    },
                  );
                }),
              ),
              const Text('Total Amount: ',
                  style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    ));
  }
}
