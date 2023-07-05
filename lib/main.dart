import 'package:flutter/material.dart';
import 'package:foodcommerce/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Commerce',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':  (context) => const Home()
      },
    );
  }
}