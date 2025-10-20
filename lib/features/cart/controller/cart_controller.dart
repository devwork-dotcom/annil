import 'package:annill/routes/app_routes.dart';
import 'package:get/get.dart';

class CartItem {
  String name;
  double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;
}

class CartController extends GetxController {

  var cartItems = <CartItem>[
    CartItem(name: "Organic Tomatoes", price: 3.99, quantity: 1),
    CartItem(name: "Fresh Potatoes", price: 2.50, quantity: 2),
    CartItem(name: "Red Apples", price: 5.00, quantity: 1),
  ].obs;

  double get subTotal {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  double deliveryFee = 1.99;

  double get totalAmount => subTotal + deliveryFee;

  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  void navigateToCheckoutScreen (){
    Get.toNamed(AppRoute.checkoutScreen);
  }
}
