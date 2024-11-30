import 'package:flutter/material.dart';
import 'package:shopping_app/global_varibales.dart';
import 'package:shopping_app/product_detail_screen.dart';

import 'product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    "All",
    "Addids",
    "Nike",
    "Bata",
  ];

  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(189, 189, 189, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: 'Searche',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, int index) {
                  final String filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        selectedFilter = filter;
                        print(selectedFilter);
                        setState(() {});
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        label: Text(filter),
                        labelStyle: TextStyle(
                          fontSize: 17,
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
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailScreen(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCardWidget(
                      bgColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : Color.fromRGBO(245, 247, 249, 1),
                      imageUrl: product['imageUrl'].toString(),
                      title: product['title'].toString(),
                      price: product['price'] as double,
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
