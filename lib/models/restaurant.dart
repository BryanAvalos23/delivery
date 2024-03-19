import 'package:delivery/models/addon.dart';
import 'package:delivery/models/category.dart';
import 'package:delivery/models/food.dart';
import 'package:flutter/material.dart';

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
      imagePath: "lib/images/hamburguers/doublecheese.png",
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

  /*OPERATIONS */
  // Add to cart

  // remove from cart

  // get total price or cart

  // get total number of ite in cart

  // clear cart

  /*HELPERS */

  // generate a recipt

  // format double vvalue into money

  // format list of addons into a string summary
}
