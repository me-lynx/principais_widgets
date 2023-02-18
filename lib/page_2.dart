import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final List<Map<String, dynamic>> _products = [
    {'title': 'Product 1', 'price': 9.99},
    {'title': 'Product 2', 'price': 19.99},
    {'title': 'Product 3', 'price': 29.99},
    {'title': 'Product 4', 'price': 39.99},
    {'title': 'Product 5', 'price': 49.99},
    {'title': 'Product 6', 'price': 59.99},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (ctx, index) => Card(
                  child: ListTile(
                    title: Text(_products[index]['title']),
                    subtitle: Text('\$${_products[index]['price']}'),
                  ),
                ),
              ),
            ),
            Text(
              'Grid of Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 1,
                children: _products.map((product) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${product['price']}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
