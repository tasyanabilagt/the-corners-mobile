import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:the_corners/screens/product_entry_list.dart';
import 'package:the_corners/widgets/left_drawer.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();

  String? _selectedCategory;
  String? _selectedSize;
  bool _isFeatured = false;

  // Sesuai CATEGORY_CHOICES di Django
  final List<String> _categories = ['bola', 'sepatu', 'jersey', 'aksesoris', 'bundle'];
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Product')),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Name cannot be empty";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Price cannot be empty";
                  if (int.tryParse(value) == null) return "Price must be a number";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Description cannot be empty";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(
                  labelText: "Stock",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Stock cannot be empty";
                  if (int.tryParse(value) == null) return "Stock must be a number";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(
                  labelText: "Rating (0-5)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: _categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.toUpperCase()),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => _selectedCategory = newValue),
                validator: (value) => value == null ? "Please select a category" : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Size (Optional)",
                  border: OutlineInputBorder(),
                ),
                value: _selectedSize,
                items: _sizes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => _selectedSize = newValue),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _colorController,
                decoration: const InputDecoration(
                  labelText: "Color (Optional)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(
                  labelText: "Thumbnail URL",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                title: const Text("Is Featured?"),
                value: _isFeatured,
                onChanged: (bool? value) {
                  setState(() {
                    _isFeatured = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final response = await request.postJson(
                      "http://localhost:8000/create-flutter/",
                      jsonEncode(<String, dynamic>{
                        'name': _nameController.text,
                        'price': int.parse(_priceController.text),
                        'description': _descriptionController.text,
                        'stock': int.parse(_stockController.text),
                        'rating': int.tryParse(_ratingController.text) ?? 0,
                        'category': _selectedCategory,
                        'thumbnail': _thumbnailController.text,
                        'is_featured': _isFeatured,
                        'size': _selectedSize ?? '',
                        'color': _colorController.text,
                        'brand': _brandController.text,
                      }),
                    );
                    if (context.mounted) {
                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Product saved successfully!")),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Failed to save product.")),
                        );
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text("Save Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}