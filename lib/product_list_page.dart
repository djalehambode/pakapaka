import 'package:flutter/material.dart';
import 'api_service.dart';

class ProductListPage extends StatefulWidget {
  final ApiService apiService;
  const ProductListPage({required this.apiService});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<dynamic> products = [];

  Future<void> _loadProducts() async {
    final data = await widget.apiService.getProducts();
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final imageUrl = product['image']; // 👈 champ image de l'API

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported),
              title: Text("Name: $product['name']"),
              subtitle: Text("Desc: $product['description']"),
            ),
          );
        },
      ),
    );
  }
}
