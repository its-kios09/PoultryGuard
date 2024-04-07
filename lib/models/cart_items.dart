import 'package:poultryguard/models/poultrymodel.dart';

class CartItem{
  PoultryModal product;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.product,
    required this.selectedAddons,
    this.quantity = 1
});

  double get totalPrice{
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (product.price + addonsPrice) * quantity;
  }
}