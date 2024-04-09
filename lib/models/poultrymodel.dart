class PoultryModal {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final PoultryCategory category;
  List<Addon> availableAddons;

  PoultryModal(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.availableAddons,
      required this.category});
}

enum PoultryCategory { Vaccines, Feeds, Equipments }

class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}
