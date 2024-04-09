import 'package:flutter/material.dart';

class CustomDescriptionBox extends StatelessWidget {
  const CustomDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "\$0.99",
                style: TextStyle(
                  fontFamily: "JosefinSans",
                ),
              ),
              Text(
                "Delivery fee",
                style: TextStyle(
                  fontFamily: "JosefinSans",
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "15 - 30 mins",
                style: TextStyle(
                  fontFamily: "JosefinSans",
                ),
              ),
              Text(
                "Delivery time",
                style: TextStyle(
                  fontFamily: "JosefinSans",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
