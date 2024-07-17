import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekutslagi/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list menu makanan
  final List<Food> _menu = [
    //burger
    Food(
      name: "Burger Biasa",
      description: "Burger dengan isian daging biasa",
      imagePath: "lib/images/burgers/burger1.png",
      price: 10.000,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Burger Elite",
      description: "Burger dengan isian daging lebih banyak dari yang biasa ",
      imagePath: "lib/images/burgers/burger2.png",
      price: 15.000,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Burger Epic",
      description: "Burger dengan isian daging lebih banyak dari yang elite",
      imagePath: "lib/images/burgers/burger3.png",
      price: 20.000,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Burger Legend",
      description: "Burger dengan isian daging lebih banyak dari yang epic",
      imagePath: "lib/images/burgers/burger4.png",
      price: 25.000,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Burger Istimewa",
      description: "Burger dengan isian daging banyak banget",
      imagePath: "lib/images/burgers/burger5.png",
      price: 30.000,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),

    //salad
    Food(
      name: "Salad Biasa",
      description: "Salad dengan isian sayur biasa",
      imagePath: "lib/images/salads/salad1.png",
      price: 10.000,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Salad Elite",
      description: "Salad dengan isian sayur lebih banyak dari yang biasa",
      imagePath: "lib/images/salads/salad2.png",
      price: 15.000,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Salad Epic",
      description: "Salad dengan isian sayur lebih banyak dari yang elite",
      imagePath: "lib/images/salads/salad3.png",
      price: 20.000,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Salad Legend",
      description: "Salad dengan isian sayur lebih banyak dari yang epic",
      imagePath: "lib/images/salads/salad4.png",
      price: 25.000,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),
    Food(
      name: "Salad Istimewa",
      description: "Salad dengan isian sayur lebih banyak dari yang legend",
      imagePath: "lib/images/salads/salad5.png",
      price: 30.000,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Timun", price: 2.000),
        Addon(name: "Keju", price: 3.000),
        Addon(name: "Mozarella", price: 5.000),
      ],
    ),

    //side
    Food(
      name: "Minuman Strawberry",
      description: "Minuman dengan rasa strawberry yang menyegarkan",
      imagePath: "lib/images/sides/sides1.png",
      price: 10.000,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Minuman Melon",
      description: "Minuman dengan rasa melon yang menyegarkan",
      imagePath: "lib/images/sides/sides2.png",
      price: 15.000,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Minuman Lemon",
      description: "Minuman dengan rasa lemon yang menyegarkan",
      imagePath: "lib/images/sides/sides3.png",
      price: 20.000,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Minuman Lemon & Strawberry",
      description:
          "Minuman dengan rasa lemon campur strawberry yang menyegarkan",
      imagePath: "lib/images/sides/sides4.png",
      price: 25.000,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Minuman Lemon Jumbo",
      description:
          "Minuman dengan rasa lemon dengan porsi jumbo yang menyegarkan",
      imagePath: "lib/images/sides/sides5.png",
      price: 30.000,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),

    //dessert
    Food(
      name: "Pancake",
      description: "Pancake dengan rasa",
      imagePath: "lib/images/desserts/dessert1.png",
      price: 10.000,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Cream", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Bakpao",
      description: "Bapkpao dengan warna baru dan varian rasa",
      imagePath: "lib/images/desserts/dessert2.png",
      price: 15.000,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Cream", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Pancake Buah",
      description: "Pancake dengan campuran buah",
      imagePath: "lib/images/desserts/dessert3.png",
      price: 20.000,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Cream", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Roti Eskrim",
      description: "Roti dengan campuran Eskrim strawberry",
      imagePath: "lib/images/desserts/dessert4.png",
      price: 25.000,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Cream", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Yoghurt Strawberry",
      description: "Yoghurt dengan rasa strawberry",
      imagePath: "lib/images/desserts/dessert5.png",
      price: 30.000,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Cream", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),

    //drink
    Food(
      name: "Es Jeruk",
      description: "Es jeruk biasa",
      imagePath: "lib/images/drinks/drink1.png",
      price: 10.000,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Es Teh",
      description: "Es Teh biasa",
      imagePath: "lib/images/drinks/drink2.png",
      price: 15.000,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Cocktail",
      description: "Cocktail dengan berbagai rasa",
      imagePath: "lib/images/drinks/drink3.png",
      price: 20.000,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Smoothies Strawberry",
      description: "Smoothies dengan rasa strawberry yang lezat",
      imagePath: "lib/images/drinks/drink4.png",
      price: 25.000,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
    Food(
      name: "Es Rumput",
      description: "Minuman dengan khasiat yang menyehatkan tubuh",
      imagePath: "lib/images/drinks/drink5.png",
      price: 30.000,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Es Batu", price: 2.000),
        Addon(name: "Susu", price: 3.000),
        Addon(name: "Boba", price: 5.000),
      ],
    ),
  ];

  //
  //G E T T E R S
  //

  //
  // O P E R A T I O N
  //

  //keranjang pengguna
  final List<CartItem> _cart = [];

  String _deliveryAddres = 'Ruang TI-22A1';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddres => _deliveryAddres;

  //tambah ke keranjang
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //cek apakah ada barang yang sama yang di pilih
      bool isSameFood = item.food == food;

      //cek apakah ada addon yang sama yang di pilih
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // jika item sudah ada, tambahkan jumlahnya
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // kalau beloma ada, buat baru dan tambahkan
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //hapus dari keranjang
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

  //total dari keranjang
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //total item yang ada di keranjang
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear keranjang
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddres = newAddress;
    notifyListeners();
  }

  //
  // H E L P E R
  //

  //cetak nota
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Nota Anda");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('_______');

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
            "     Add-ons : ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("______");
    receipt.writeln();
    receipt.writeln("Total Item : ${getTotalItemCount()}");
    receipt.writeln("Total Harga : ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Mengantarkan pesanan ke: $deliveryAddres");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\Rp${price.toStringAsFixed(2)}";
  }

  //
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
