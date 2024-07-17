import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projekutslagi/services/auth/auth_gate.dart';
import 'package:projekutslagi/services/auth/login_or_register.dart';
import 'package:projekutslagi/firebase_options.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:projekutslagi/splash_screen.dart';
import 'package:projekutslagi/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    //theme provider
    MultiProvider(
      providers: [
        //theme
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        //resturant
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
