import 'package:flutter/material.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Terimakasih sudah order",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => Text(
                  restaurant.displayCartReceipt(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Perkiraan Jadi 5 Menit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
