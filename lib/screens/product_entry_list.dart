import 'package:flutter/material.dart';
import 'package:the_corners/models/product_entry.dart';
import 'package:the_corners/widgets/left_drawer.dart';
import 'package:the_corners/screens/product_detail.dart';
import 'package:the_corners/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  // 1. Deklarasi Future di state class
  late Future<List<ProductEntry>> _futureProducts;

  // Fungsi fetchProducts tetap sama
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Pastikan URL sudah benar (localhost:8000 dan path JSON yang benar)
    final response = await request.get('http://localhost:8000/json/');

    var data = response;
    List<ProductEntry> listProducts = [];

    if (data is List) {
      for (var d in data) {
        if (d != null) {
          // Pastikan model ProductEntry sudah menerapkan null-safety (?? "" atau ? )
          listProducts.add(ProductEntry.fromJson(d));
        }
      }
    } else {
      print('Warning: Response data is not a List. Received: $data');
      return [];
    }
    return listProducts;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final request = context.read<CookieRequest>();
    _futureProducts = fetchProducts(request);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<ProductEntry>>(
        future: _futureProducts,
        builder: (context, AsyncSnapshot<List<ProductEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'Error loading data: ${snapshot.error}. Cek URL dan Server Django.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red)
                  ),
                )
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox_outlined, size: 50, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    'There are no products in The Corners yet.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: snapshot.data![index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: snapshot.data![index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}