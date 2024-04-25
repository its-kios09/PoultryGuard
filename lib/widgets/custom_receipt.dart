import 'package:flutter/material.dart';
import 'package:poultryguard/models/poultryshopmodel.dart';
import 'package:provider/provider.dart';

class CustomReceipt extends StatelessWidget {
  const CustomReceipt({super.key});


  @override
  Widget build(BuildContext context) {
    DateTime estimatedDeliveryTime = DateTime.now().add(Duration(minutes: 5));
    String estimatedDeliveryTimeString = estimatedDeliveryTime.toString();
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thank you for your order!",
              style: TextStyle(fontFamily: "JosefinSans"),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Consumer<Shop>(
                    builder: (context, shop, child) => Text(
                      shop.displayCartReceipt(),
                      style: const TextStyle(fontFamily: "JosefinSans"),
                    ),
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Estimated delivery time is: $estimatedDeliveryTimeString",
              style: const TextStyle(fontFamily: "JosefinSans"),
            ),
          ],
        ),
      ),
    );
  }
}
