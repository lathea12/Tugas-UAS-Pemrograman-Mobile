import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projekutslagi/services/auth/login_or_register.dart';
import 'package:projekutslagi/pages/home_page.dart';
import 'package:projekutslagi/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // buat setting waktu dari lottie nya
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          // buat menuju kemana setelah 5 detik
          MaterialPageRoute(builder: ((context) => const LoginOrRegister())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // kalo mau dari link atau internet pake nya lotti.network
          // Lottie.network(
          //     "https://lottie.host/813bf624-79f0-4162-84df-7afff10d2afd/U0EyBKwgOm.json"),

          // kalo mau dari asset langsung aja lotti.asset
          Lottie.asset("lib/Lottie/lottie.json")
        ],
      ),
    );
  }
}
