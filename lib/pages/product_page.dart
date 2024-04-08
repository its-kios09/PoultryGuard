import 'package:flutter/material.dart';
import 'package:poultryguard/models/poultrymodel.dart';
import 'package:poultryguard/models/poultryshopmodel.dart';
import 'package:poultryguard/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final PoultryModal product;
  final Map<Addon, bool> selectedAddons = {};
  ProductPage({
    super.key,
    required this.product,
  }) {
    for (Addon addon in product.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void addToCart(PoultryModal product, Map<Addon, bool> selectedAddons){

    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.product.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Shop>().addToCart(product, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.product.imagePath),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontFamily: "JosefinSans",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${widget.product.price.toString()}",
                        style: TextStyle(
                            fontFamily: "JosefinSans",
                            fontSize: 16,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.product.description,
                        style: TextStyle(
                            fontFamily: "JosefinSans",
                            fontSize: 16,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Addons",
                        style: TextStyle(
                            fontFamily: "JosefinSans",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.product.availableAddons.length,
                            itemBuilder: (context, index) {
                              Addon addon =
                                  widget.product.availableAddons[index];
                              return CheckboxListTile(
                                  title: Text(
                                    addon.name,
                                    style: const TextStyle(
                                      fontFamily: "JosefinSans",
                                    ),
                                  ),
                                  subtitle: Text(
                                    "\$${addon.price.toString()}",
                                    style: TextStyle(
                                        fontFamily: "JosefinSans",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                                  ),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  });
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child:
                              CustomButton(onTap: ()=> addToCart(widget.product, widget.selectedAddons), text: "Add to Cart")),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
