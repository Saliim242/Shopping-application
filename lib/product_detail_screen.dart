import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSize = 0;
  @override
  void initState() {
    // selectedSize = (widget.product['sizes'] as List<int>)[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            width: double.infinity,
            height: 260,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, int index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                              print("You Selected $selectedSize");
                            });
                          },
                          child: Chip(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            label: Text(
                              size.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
