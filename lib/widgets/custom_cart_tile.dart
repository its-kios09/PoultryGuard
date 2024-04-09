import 'package:flutter/material.dart';
import 'package:poultryguard/models/cart_items.dart';
import 'package:poultryguard/models/poultryshopmodel.dart';
import 'package:provider/provider.dart';

import 'custom_quantity_selector.dart';

class CustomCartTile extends StatelessWidget {
  final CartItem cartItem;
  const CustomCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, shop, child) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              cartItem.product.imagePath,
                              width: 120,
                              height: 120,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.product.name,
                              style: const TextStyle(fontFamily: "JosefinSans"),
                            ),
                            Text(
                              "\$${cartItem.product.price.toString()}",
                              style: const TextStyle(
                                fontFamily: "JosefinSans",
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomQuantitySelector(
                          quantity: cartItem.quantity,
                          product: cartItem.product,
                          onDecrement: () {
                            shop.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            shop.addToCart(
                                cartItem.product, cartItem.selectedAddons);
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 10, right: 10),
                      children: cartItem.selectedAddons
                          .map((addon) => Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      Text(addon.name),
                                      Text(
                                        "   (Ksh ${addon.price.toString()})",
                                        style: TextStyle(
                                          fontFamily: "JosefinSans",
                                          color: Theme.of(context).colorScheme.inversePrimary,
                                        ),
                                      ),

                                    ],
                                  ),
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary)),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontSize: 12,
                                      fontFamily: "JosefinSans"),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ));
  }
}
