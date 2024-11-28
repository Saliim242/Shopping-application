import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final Color bgColor;
  const ProductCardWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              fit: BoxFit.cover,
              imageUrl,
              height: 135,
            ),
          )
        ],
      ),
    );
  }
}
