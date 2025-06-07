import 'package:flutter/material.dart';
import 'package:shopapp/global_var.dart';
import 'package:shopapp/product_card.dart';
import 'package:shopapp/product_details.dart';
class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
   var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
    );
  final List<String> filters = const ["All", "Addidas", "Nike", "Bata"];

  late String selectedFilter;
    @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  var filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        selectedFilter = filter;
                        setState(() {});
                      },
                      child: Chip(
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        backgroundColor:
                            selectedFilter == filter
                                ? Color.fromRGBO(254, 206, 1, 1)
                                : Color.fromRGBO(245, 247, 249, 1),
                        label: Text(filter),
                        labelStyle: TextStyle(fontSize: 16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      assetName: product['imageUrl'] as String,
                      i: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}