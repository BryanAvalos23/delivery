import 'package:delivery/components/quantity_selector.dart';
import 'package:delivery/models/cart_item.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        child: Column(
          children: [
            Row(
              children: [
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),

                // name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(
                      cartItem.food.name,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // food price
                    Text(
                      '\$${cartItem.food.price.toString()}',
                    ),
                  ],
                ),

                // increment or decrement quantity
                QuantitySelector(
                  quantity: cartItem.quantity,
                  food: cartItem.food,
                  onIncrement: () {
                    restaurant.addToCart(
                      cartItem.food,
                      cartItem.selectedAddons,
                    );
                  },
                  onDecrement: () {
                    restaurant.removeFromCart(
                      cartItem,
                    );
                  },
                ),
              ],
            ),

            // addons
          ],
        ),
      ),
    );
  }
}
