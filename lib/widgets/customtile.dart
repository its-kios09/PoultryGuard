import 'package:flutter/material.dart';
import 'package:poultryguard/models/poultrymodel.dart';

class ProductTile extends StatelessWidget {
  final PoultryModal product;
  final void Function()? onTap;

  const ProductTile({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontFamily: "JosefinSans",
                        ),
                      ),
                      Text("\$${product.price}",
                        style: TextStyle(
                          fontFamily: "JosefinSans",
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        product.description,
                        style:  TextStyle(
                            fontFamily: "JosefinSans",
                            color: Theme.of(context).colorScheme.inversePrimary

                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                    child: Image.asset(product.imagePath, height: 120)
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
