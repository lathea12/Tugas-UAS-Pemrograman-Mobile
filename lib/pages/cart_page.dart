import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projekutslagi/components/my_button.dart';
import 'package:projekutslagi/components/my_cart_tile.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:projekutslagi/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Keranjang"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // button kosongkan keranjang
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Apakah anda yakin mengosongkan keranjang?"),
                      actions: [
                        //batalkan button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Batalkan'),
                        ),

                        //lanjutkan button atau kosongkan button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Lanjutkan"),
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          body: Column(
            children: [
              //list dari keranjang
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Keranjang kamu masih kosong"),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  //get individual cart item
                                  final CartItem = userCart[index];

                                  //kembali ke cart tile UI
                                  return MyCartTile(cartItem: CartItem);
                                }),
                          )
                  ],
                ),
              ),

              //button untuk checkout
              MyButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
                  ),
                ),
                text: "Bayar Sekarang",
              ),

              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
