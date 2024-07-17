import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_quantity_selector.dart';
import 'package:projekutslagi/models/cart_item.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // gambar makananan
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 60,
                            width: 60,
                          ),
                        ),

                        const SizedBox(width: 10),

                        //nama dan harga makanan
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //nama makanan disini
                            Text(
                              cartItem.food.name,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),

                            //harga makanan
                            Text(
                              'Rp${cartItem.food.price}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          ],
                        ),

                        const Spacer(),

                        //jumlah makanan yang ada di keranjang
                        QuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            restaurant.addToCart(
                                cartItem.food, cartItem.selectedAddons);
                          },
                        )
                      ],
                    ),
                  ),

                  //addon atau tambahan
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      children: cartItem.selectedAddons
                          .map(
                            (addon) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Row(
                                  children: [
                                    //nama tambahan ( es batu dan lain lain)
                                    Text(addon.name),

                                    //harga tambahan (es batu dan lain lain)
                                    Text(' (Rp${addon.price})'),
                                  ],
                                ),
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                onSelected: (value) {},
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                labelStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ));
  }
}
