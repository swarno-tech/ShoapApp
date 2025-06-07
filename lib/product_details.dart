import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.product['title'] as String,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage(widget.product['imageUrl'] as String),
            ),
          ),
          const Spacer(flex: 2),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 250,
            width: double.infinity,
            color: Color.fromRGBO(245, 247, 249, 1),
            child: Column(
              children: [
                Text(
                  "\$ ${widget.product['price'] as double}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List).length,
                    itemBuilder: (context, index) {
                      final size = (widget.product['sizes'] as List)[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedSize = size;
                            setState(() {});
                          },
                          child: Chip(
                            backgroundColor:
                                selectedSize == size
                                    ? Color.fromRGBO(254, 206, 1, 1)
                                    : Color.fromRGBO(225, 225, 225, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${(widget.product['sizes'] as List)[index]}",
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedSize != 0) {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addProduct({
                          'id': widget.product['id'],
                          'title': widget.product['title'],
                          'price': widget.product['price'],
                          'imageUrl': widget.product['imageUrl'],
                          'company': widget.product['company'],
                          'sizes': selectedSize,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Product added successfully")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please select a size!")),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromRGBO(254, 206, 1, 1),
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(double.infinity, 40),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            "Add To Cart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
