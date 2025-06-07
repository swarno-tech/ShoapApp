import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String assetName;
  final int i;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.assetName,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            i.isEven
                ? Color.fromRGBO(216, 240, 253, 1)
                : Color.fromRGBO(245, 247, 249, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "\$$price",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Center(child: Image(image: AssetImage(assetName), height: 175)),
        ],
      ),
    );
  }
}
