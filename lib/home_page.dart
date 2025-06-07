import 'package:flutter/material.dart';
import 'package:shopapp/cart_page.dart';
import 'package:shopapp/page_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [PageHome(), CartPage()];
  int currPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currPage,
        onTap: (value) {
          currPage = value;
          setState(() {});
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 30,
        selectedItemColor: Color.fromRGBO(254, 206, 1, 1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
