import 'package:flutter/material.dart';

import '../pages/cart_page.dart';

class CustomSilverBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final int itemCount; // Add itemCount parameter

  const CustomSilverBar({
    super.key,
    required this.child,
    required this.title,
    required this.itemCount, // Initialize itemCount parameter
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Center(
        child: Text(
          "Poultry Guard Store",
          style: TextStyle(fontFamily: "JosefinSans"),
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            Positioned(
              right: 0,
              child: itemCount > 0
                  ? CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Text(
                  itemCount.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              )
                  : Container(),
            ),
          ],
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
