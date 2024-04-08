import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poultryguard/models/poultryshopmodel.dart';
import 'package:poultryguard/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, shop, child) {
      final userCart = shop.cart;

      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Poultry Guard Cart",
              style: TextStyle(fontFamily: "JosefinSans"),
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              "Are you sure you want to clear the cart?",
                              style: TextStyle(
                                  fontFamily: "JosefinSans", fontSize: 16),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(fontFamily: "JosefinSans"),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  shop.clearCart();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(fontFamily: "JosefinSans"),
                                ),
                              )
                            ],
                          ));
                },
                icon: const Icon(Icons.delete_rounded))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                        child: Center(
                          child: Text(
                              "The Cart is empty...",
                              style: TextStyle(fontFamily: "JosefinSans", fontSize: 16),
                            ),
                        ),
                      )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return CustomCartTile(
                                  cartItem: cartItem,
                                );
                              }))
                ],
              ),
            ),
            CustomButton(onTap: (){}, text: "Checkout"),
            const SizedBox(height: 25,)
          ],
        ),
      );
    });
  }
}
