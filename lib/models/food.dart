//item makanan
// ignore_for_file: constant_identifier_names

class Food {
  final String name; // beef_burger
  final String description; // burger with beef
  final String imagePath; // lib/images/beef_burger.png
  final double price; // Rp 15.000
  final FoodCategory category; // burger
  List<Addon> availableAddons; // cheese

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//jenis makanan
enum FoodCategory {
  Burgers,
  Salads,
  Sides,
  Desserts,
  Drinks,
}

//tambahan makanan
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
