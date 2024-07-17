import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_button.dart';
import 'package:projekutslagi/components/my_textfield.dart';
import 'package:projekutslagi/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();
  final _noteController = TextEditingController();

  void userTappedPay() {
    if (_formKey.currentState!.validate()) {
      // Show dialog with form values
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Konfirmasi Pembayaran"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Nama: ${_nameController.text}"),
                Text("No Telefon: ${_phoneController.text}"),
                Text("PIN: ${_pinController.text}"),
                Text("Pesan/Note: ${_noteController.text}"),
              ],
            ),
          ),
          actions: [
            // Button batalkan
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batalkan"),
            ),

            // Lanjutkan
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Lanjutkan"),
            )
          ],
        ),
      );
    } else {
      // Show error message or highlight invalid fields
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bayar"),
      ),
      body: Column(
        children: [
          //logo
          Image.asset(
            'lib/images/logobayar.png', // replace with your logo image file
            width: 100, // adjust the width to your liking
            height: 100, // adjust the height to your liking
          ),

          // Form
          Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextField(
                  controller: _nameController,
                  hintText: "Nama. . .",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: _phoneController,
                  hintText: "Nomer HP. . .",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: _pinController,
                  hintText: "Password. . .",
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: _noteController,
                  hintText: "Pesan. . .",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),

          const Spacer(),

          MyButton(
            onTap: userTappedPay,
            text: "Bayar",
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
