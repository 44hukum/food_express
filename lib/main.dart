import 'package:flutter/material.dart';
import 'package:foodcommerce/pages/checkout.dart';
import 'package:foodcommerce/pages/home.dart';
import 'package:foodcommerce/pages/login.dart';
import 'package:foodcommerce/pages/signup.dart';
import 'package:foodcommerce/screen/restaurant_info.dart';
import 'package:foodcommerce/services/cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getString('user') != null ? true : false;

  print(prefs.get('user'));
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Food Express',
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? 'home' : 'login',
        routes: {
          'home': (context) => const Home(),
          'checkout': (context) => const MyCheckoutCart(),
          'login': (context) => LoginPage(),
          'signup': (context) => SignupPage(),
          'info': (context) => RestaurantInfoPage()
        },
      ),
    );
  }
}
