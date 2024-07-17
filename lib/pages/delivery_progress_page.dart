import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_receipt.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:projekutslagi/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //akses dari database
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //kalau sudah samapi page nota, maka akan submit data ke database
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
        body: const Column(
          children: [
            MyReceipt(),
          ],
        ));
  }

  // kustom navbar
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile picture
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sahrul",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "085-123-456-789",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const Spacer(),

          //message button
          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10),

              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
