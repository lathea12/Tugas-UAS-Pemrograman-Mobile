import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //textstyle
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //harga kirim
          Column(
            children: [
              Text(
                'Ongkir',
                style: myPrimaryTextStyle,
              ),
              Text(
                '\Rp 5.000',
                style: mySecondaryTextStyle,
              ),
            ],
          ),

          //perkiraan jadi
          Column(
            children: [
              Text(
                'Perkiraan Selesai',
                style: myPrimaryTextStyle,
              ),
              Text(
                '15-30 Menit',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
