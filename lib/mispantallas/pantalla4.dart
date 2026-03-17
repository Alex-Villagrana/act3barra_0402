import 'package:flutter/material.dart';

Widget buildSudaderasScreen() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: _buildProductDetailCard(
      'https://raw.githubusercontent.com/Alex-Villagrana/imagen_act11/refs/heads/main/billabong.webp',
      'BILLABONG',
      'Sudadera Capucha',
      '€74.95',
    ),
  );
}

Widget _buildProductDetailCard(String imageUrl, String brand, String name, String price) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(imageUrl),
      const SizedBox(height: 16),
      Text(brand, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Text(name, style: const TextStyle(fontSize: 18)),
      const SizedBox(height: 8),
      Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
      // Add more details like size, color selectors etc. here
    ],
  );
}
