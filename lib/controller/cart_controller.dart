import 'package:get/get.dart';
import 'package:shopping_page/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
