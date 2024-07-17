import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekutslagi/pages/home_page.dart';
import 'package:projekutslagi/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // kalo user login
          if (snapshot.hasData) {
            return const HomePage();
          }

          //user tidak login
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
