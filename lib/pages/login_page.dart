// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_button.dart';
import 'package:projekutslagi/components/my_textfield.dart';
import 'package:projekutslagi/pages/home_page.dart';
import 'package:projekutslagi/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //buat edit controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
    //get instance auth service
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
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
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // pesan
            Text(
              "Kantin Mas Rusdi",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            //email 2
            // const MyTextField(),

            // //password 2
            // const MyTextField(),

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

            // const SizedBox(height: 25),

            //lupa password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lupa Password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //sign in button
            MyButton(
              text: "LOGIN",
              onTap: login,
            ),

            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum Ada Akun?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Buat sekarang",
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
