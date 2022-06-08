import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shopping_page/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'PeakMilk',
          productImage: 'productImage',
          productDescription: 'Best Milk Ever',
          price: 35),
      Product(
          id: 2,
          productName: 'PeakMilk',
          productImage: 'productImage',
          productDescription: 'Best Milk Ever',
          price: 40),
      Product(
          id: 3,
          productName: 'PeakMilk',
          productImage: 'productImage',
          productDescription: 'Best Milk Ever',
          price: 50),
    ];

    products.value = productResult;
  }
}
