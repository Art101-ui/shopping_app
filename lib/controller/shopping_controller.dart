

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
          productDescription: 'best milk ever',
          price: 35.0),
      Product(
          id: 2,
          productName: 'Adiddas',
          productImage: 'productImage',
          productDescription: "Gear up with the latest shoes",
          price: 40.5),
      Product(
          id: 3,
          productName: 'G-Shock',
          productImage: 'productImage',
          productDescription: 'love wearing this wristwatch',
          price: 50.0),
    ];

    products.value = productResult;
  }
}
