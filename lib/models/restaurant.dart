import 'package:collection/collection.dart';
import 'package:delivery/models/addon.dart';
import 'package:delivery/models/cart_item.dart';
import 'package:delivery/models/category.dart';
import 'package:delivery/models/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic hamburguer",
      description: "A classic hamburguer white cheese and vegetables",
      imagePath: "lib/images/hamburguers/hamburguer.png",
      price: 5.99,
      category: FoodCategory.burgers,
      availableAddon: [
        Addon(
          name: "extra onions",
          price: 0.99,
        ),
        Addon(
          name: "Bacon",
          price: 0.99,
        ),
        Addon(
          name: "Extra cheese",
          price: 1.25,
        )
      ],
    ),
    Food(
      name: "Double cheese hamburguer",
      description:
          "A classic burger in the next level include double cheese and doble meet",
      imagePath: "lib/images/hamburguers/doblecheese.png",
      price: 7.50,
      category: FoodCategory.burgers,
      availableAddon: [
        Addon(
          name: "extra onions",
          price: 0.99,
        ),
        Addon(
          name: "Extra bacon",
          price: 1.50,
        ),
        Addon(
          name: "mushrooms",
          price: 1.99,
        )
      ],
    ),

    // pizza
    Food(
      name: "Pizza cheese",
      description:
          "are you fan to the cheese? this is for you, one pizza with extra cheese",
      imagePath: "lib/images/pizza/cheese.png",
      price: 5.75,
      category: FoodCategory.pizza,
      availableAddon: [
        Addon(
          name: "extra cheese",
          price: 1.25,
        ),
        Addon(
          name: "Bacon",
          price: 1.50,
        ),
        Addon(
          name: "mushrooms",
          price: 1.99,
        )
      ],
    ),
    Food(
      name: "Peperoni pizza",
      description: "One pizza with full flavor to the peperoni",
      imagePath: "lib/images/pizza/peperoni.png",
      price: 7.50,
      category: FoodCategory.pizza,
      availableAddon: [
        Addon(
          name: "Extra cheese",
          price: 0.99,
        ),
        Addon(
          name: "Extra peperoni",
          price: 0.99,
        ),
        Addon(
          name: "mushrooms",
          price: 1.99,
        )
      ],
    ),
  ];

  /* GETTERS */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*OPERATIONS */

  // user cart
  final List<CartItem> _cart = [];

  // Add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // See if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of sleected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exist, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }

    notifyListeners();
  }

  // remove from cart
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

  // get total price or cart
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

  // get total number of ite in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*HELPERS */

  // generate a recipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total items: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double vvalue into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
