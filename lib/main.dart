import 'package:flutter/material.dart';
import 'package:foodcommerce/pages/checkout.dart';
import 'package:foodcommerce/pages/home.dart';
import 'package:foodcommerce/pages/login.dart';
import 'package:foodcommerce/pages/signup.dart';
import 'package:foodcommerce/screen/restaurant_info.dart';
import 'package:foodcommerce/services/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CartModel(),
      child: MaterialApp(
        title: 'Food Commerce',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home':  (context) => const Home(),
          'checkout':  (context) => const MyCheckoutCart(),
          'login': (context) => LoginPage(),
          'signup': (context) => SignupPage(),
          'info': (context) => RestaurantInfoPage()

        },
      ),
    );
  }
}