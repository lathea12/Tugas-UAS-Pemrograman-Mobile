// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:projekutslagi/services/auth/auth_service.dart';
import 'package:projekutslagi/services/auth/login_or_register.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //buat edit controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    //get auth service
    final authService = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      // buat user
      try {
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        //show kalo terjadi error
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    //kalo password dan konfirmasi password tidak sesuai
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Password Tidak Cocok'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //pesan
            Text(
              "Kantin Mas Rusdi",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //email
            MyTextField(
              controller: emailController,
              hintText: "Username",
              obscureText: false,
            ),
            const SizedBox(height: 10),

            //pasword
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // confirm pasword
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Konfirmasi Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            //sign in button
            MyButton(
              text: "BUAT",
              onTap: register,
            ),

            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah Ada Akun?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Sekarang",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
