import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/cart_provider.dart';
//import 'package:shopapp/home_page.dart';
import 'package:shopapp/login_page.dart';
// import 'package:shopapp/home_page.dart';
// import 'package:shopapp/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        home: LoginPage(),
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
        ),
      ),
    );
  }
}
