import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:poultryguard/models/cart_items.dart';
import 'package:poultryguard/models/poultrymodel.dart';

class Shop extends ChangeNotifier{
  final List<PoultryModal> _productMenu = [
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/supplements/supplement1.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Feeds
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/supplements/supplement2.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Feeds
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/supplements/supplement3.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Feeds
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/supplements/supplement4.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Feeds
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/supplements/supplement5.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Feeds
    ),

    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/equipments/equipment1.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Equipments
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/equipments/equipment2.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Equipments
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/equipments/equipment3.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Equipments
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/equipments/equipment4.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Equipments
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/equipments/equipment5.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Equipments
    ),


    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/medication/vaccine1.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Vaccines
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/medication/vaccine2.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Vaccines
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/medication/vaccine3.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Vaccines
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/medication/vaccine4.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Vaccines
    ),
    PoultryModal(
        name: "Glucovita C",
        description: "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/medication/vaccine5.png",
        price: 100,
        availableAddons: [
          Addon(name: "Strip Cups", price: 0.99)
        ],
        category: PoultryCategory.Vaccines
    ),
  ];

  List<PoultryModal> get productMenu => _productMenu;

  final List<CartItem> _cart = [];

  void addToCart(PoultryModal product, List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      bool isSameProduct = item.product == product;
      bool isSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameProduct && isSameAddons;
    });
    if(cartItem != null){
      cartItem.quantity++;
    }else{
      _cart.add(CartItem(product: product, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }
  double getTotalPrice(){
    double total = 0.0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.product.price;
      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount(){
    int totalItemCount = 0;
    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }
}