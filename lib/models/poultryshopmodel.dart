import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:poultryguard/models/cart_items.dart';
import 'package:poultryguard/models/poultrymodel.dart';

class Shop extends ChangeNotifier {
  final List<PoultryModal> _productMenu = [
    PoultryModal(
        name: "Growel Amino Power Feed Premix",
        description:
        "Growel Amino Power Feed Premix – A Blend of 46 Amino Acids, Vitamins, and Minerals for Growth and Immunity of Aqua, Poultry, Cattle, Horse, Pig, Goat and Sheep – 1 kg",
        imagePath: "assets/images/products/supplements/supplement1.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Feeds),
    PoultryModal(
        name: "Growel Grow-Cal D3",
        description:
        "Growel Grow-Cal D3 - Feed Premix : A Powerful Calcium Feed Premix with Vitamins, Zinc, and Magnesium for Poultry, Cattle, Horse, Pig, Goats and Sheep - 1 kg.",
        imagePath: "assets/images/products/supplements/supplement2.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Feeds),
    PoultryModal(
        name: "Growel Grow B-Plex",
        description:
        "Feed Premix with 19 Vitamins, Amino Acids and Minerals for Aquaculture, Poultry, Cattle, Horses, Pigs, Goats and Sheep – 1 kg.",
        imagePath: "assets/images/products/supplements/supplement3.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Feeds),
    PoultryModal(
        name: "Glucovita C",
        description:
        "Glucovita C is an effective combination of vitamin C and dextrose indicated to combat deficiency and provide an energy boost for poultry (day-old chicks, growing birds).",
        imagePath: "assets/images/products/supplements/supplement4.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Feeds),
    PoultryModal(
        name: "Growel Chelated Growmin Forte",
        description:
        "Growel Chelated Growmin Forte- Feed Premix: Powerful Chelated Minerals Mixture for Aquacultures, Poultry, Cattle, Horse, Pig, Goats and Sheep - 1 kg.",
        imagePath: "assets/images/products/supplements/supplement5.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Feeds),
    PoultryModal(
        name: "Chicken plucking fingers",
        description:
        "Chicken plucking fingers are made of high-grade natural rubber for durability and flexibility. This design provides an excellent way to pluck feathers without damaging the bird's skin. NOTE: Keep out of direct sunlight and cold conditions to prolong the rubber's lifespan.",
        imagePath: "assets/images/products/equipments/equipment1.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Equipments),
    PoultryModal(
        name: "Boiler Cage",
        description:
        "Boiler production will increase to 98% rearing in Best Boiler cage. it gives a clean way for cleaning the cages",
        imagePath: "assets/images/products/equipments/equipment2.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Equipments),
    PoultryModal(
        name: "Layers Cage",
        description:
        "Egg production will increase to 98% rearing in Best Layer cage. After the egg laying grow",
        imagePath: "assets/images/products/equipments/equipment3.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Equipments),
    PoultryModal(
        name: "Top-quality 4-Litres Drinker",
        description:
        "This high-quality 4-Liters Drinker is meticulously designed to cater to the dietary needs of a wide range of poultry, including Chicken, Duck, Goose, Quail, Pigeon, and other similar birds. Can be used for Chicks as well as adult poultry.",
        imagePath: "assets/images/products/equipments/equipment4.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Equipments),
    PoultryModal(
        name: "Square Drip Cups",
        description:
        "The cup prevents the dripping of water into litter or on the body of the birds. They can be used for broilers, layers, and breeders.",
        imagePath: "assets/images/products/equipments/equipment5.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Equipments),
    PoultryModal(
        name: "Growel Gout Suraksha",
        description:
        "Growel Gout Suraksha – Gout Supplements for Poultry, Pet Birds and Pigeons – 1 gm",
        imagePath: "assets/images/products/medication/vaccine1.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Vaccines),
    PoultryModal(
        name: "Growel Growlive Forte",
        description:
        "Growel Growlive Forte –Liver Tonic for Digestion, Appetite, Better FCR, Growth and Feed Intake of Aqua, Poultry, Cattle, Horse, Pig, Goats, Pigeons and Birds - 250 ml",
        imagePath: "assets/images/products/medication/vaccine2.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Vaccines),
    PoultryModal(
        name: "Enrofloxacin Oral Solution",
        description:
        "Enrofloxacin Oral Solution - used in the treatment of bacterial infections. It is also used in infections of urinary tract, tonsils, sinus, nose, throat, female genital organ, skin & soft tissues and lungs (pneumonia)",
        imagePath: "assets/images/products/medication/vaccine3.jpg",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Vaccines),
    PoultryModal(
        name: "Growel Viraclean",
        description:
        "A powerful disinfectant for Aquaculture, Poultry, Cattle, Horses, Pigs, Goats, Sheep,Pigeons and Birds 200g",
        imagePath: "assets/images/products/medication/vaccine4.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Vaccines),
    PoultryModal(
        name: "Growel Grow B-Plex",
        description:
        "Growel Grow B-Plex - Vitamin Supplements with 19 Vitamins, Amino Acids and Minerals for Aqua, Poultry, Cattle, Horses, Pigs, Goats, Sheep, Pigeons and Birds - 250 ml.",
        imagePath: "assets/images/products/medication/vaccine5.png",
        price: 1,
        availableAddons: [Addon(name: "Strip Cups", price: 0.99)],
        category: PoultryCategory.Vaccines),
  ];

  List<PoultryModal> get productMenu => _productMenu;
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  void addToCart(PoultryModal product, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameProduct = item.product == product;
      bool isSameAddons =
      const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameProduct && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(product: product, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.product.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}