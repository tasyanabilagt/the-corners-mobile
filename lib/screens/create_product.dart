import 'package:flutter/material.dart';
import 'package:the_corners/menu.dart';
class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  String? _selectedCategory;
  String? _selectedSize;
  bool _isFeatured = false;

  final List<String> _categories = ['Shoes', 'Balls', 'Jerseys', 'Accessories'];
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Product Saved Successfully"),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("🛍 Name: ${_nameController.text}"),
                  Text("💰 Price: Rp${_priceController.text}"),
                  Text("📦 Stock: ${_stockController.text} pcs"),
                  Text("📏 Size: ${_selectedSize ?? '-'}"),
                  Text("🎨 Color: ${_colorController.text}"),
                  Text("⭐ Rating: ${_ratingController.text}"),
                  Text("🏷 Category: ${_selectedCategory ?? '-'}"),
                  Text("🖼 Thumbnail: ${_thumbnailController.text}"),
                  Text("🔥 Featured: ${_isFeatured ? 'Yes' : 'No'}"),
                  const SizedBox(height: 10),
                  Text("📝 Description: ${_descriptionController.text}"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // nutup dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  ); // langsung ke Home
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }
  }

  InputDecoration _inputDecoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1E3A8A)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFF6B6B), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "The ",
                style: TextStyle(
                  color: Color(0xFFFF6B6B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: "Corners",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add New Product",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Fill out the product details to add a new item to The Corners.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Name
                  TextFormField(
                    controller: _nameController,
                    decoration: _inputDecoration("Product Name", hint: "e.g. Nike Air Zoom"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Name cannot be empty";
                      if (value.length < 3) return "Name too short";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Price
                  TextFormField(
                    controller: _priceController,
                    decoration: _inputDecoration("Price", hint: "e.g. 1500000"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Price cannot be empty";
                      final price = double.tryParse(value);
                      if (price == null || price <= 0) return "Enter a valid positive price";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Stock
                  TextFormField(
                    controller: _stockController,
                    decoration: _inputDecoration("Stock", hint: "e.g. 30"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Stock cannot be empty";
                      final stock = int.tryParse(value);
                      if (stock == null || stock < 0) return "Stock must be a positive integer";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Size
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Size"),
                    value: _selectedSize,
                    items: _sizes
                        .map((size) => DropdownMenuItem(
                      value: size,
                      child: Text(size),
                    ))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedSize = value),
                    validator: (value) => value == null ? "Please select a size" : null,
                  ),
                  const SizedBox(height: 16),

                  // Color
                  TextFormField(
                    controller: _colorController,
                    decoration: _inputDecoration("Color", hint: "e.g. Red / Black"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Color cannot be empty" : null,
                  ),
                  const SizedBox(height: 16),

                  // Rating
                  TextFormField(
                    controller: _ratingController,
                    decoration: _inputDecoration("Rating (1–5)", hint: "e.g. 4.5"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Rating cannot be empty";
                      final rating = double.tryParse(value);
                      if (rating == null || rating < 0 || rating > 5) {
                        return "Rating must be between 0 and 5";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Category
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Category"),
                    value: _selectedCategory,
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    ))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedCategory = value),
                    validator: (value) => value == null ? "Please select a category" : null,
                  ),
                  const SizedBox(height: 16),

                  // Thumbnail URL
                  TextFormField(
                    controller: _thumbnailController,
                    decoration: _inputDecoration("Thumbnail URL", hint: "e.g. https://..."),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Thumbnail cannot be empty";
                      if (!Uri.tryParse(value)!.isAbsolute) return "Enter a valid URL";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Description
                  TextFormField(
                    controller: _descriptionController,
                    decoration: _inputDecoration("Description", hint: "Enter product details..."),
                    maxLines: 3,
                    validator: (value) =>
                    value == null || value.isEmpty ? "Description cannot be empty" : null,
                  ),
                  const SizedBox(height: 16),

                  // Is Featured
                  CheckboxListTile(
                    title: const Text("Mark as Featured Product"),
                    activeColor: const Color(0xFFFF6B6B),
                    value: _isFeatured,
                    onChanged: (value) => setState(() => _isFeatured = value ?? false),
                  ),
                  const SizedBox(height: 20),

                  // Save Button
                  Center(
                    child: ElevatedButton(
                      onPressed: _saveForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B6B),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Save Product",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}