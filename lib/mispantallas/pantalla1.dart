import 'package:flutter/material.dart';

Widget buildPatinetasScreen() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Organizar por:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildOrganizarSelector(),
        const SizedBox(height: 16),
        _buildDetailItem('https://raw.githubusercontent.com/Alex-Villagrana/imagen_act11/refs/heads/main/santacruzskate.webp', 'SANTA CRUZ', 'Tabla Skate Deck', '€64.95'),
        _buildDetailItem('https://raw.githubusercontent.com/Alex-Villagrana/imagen_act11/refs/heads/main/dickies.webp', 'DICKIES', 'Pantalón Chino Slim Fit', '€64.95'),
        _buildDetailItem('https://raw.githubusercontent.com/Alex-Villagrana/imagen_act11/refs/heads/main/independent.webp', 'INDEPENDENT', 'Camiseta Manga Corta', '€34.95'),

      ],
    ),
  );
}

Widget _buildOrganizarSelector() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _buildSelectorItem('Popular'),
      _buildSelectorItem('Novedades'),
      _buildSelectorItem('Precio'),
      _buildSelectorItem('Marca'),
    ],
  );
}

Widget _buildSelectorItem(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(title),
  );
}

Widget _buildDetailItem(String imageUrl, String brand, String name, String price) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl),
        const SizedBox(height: 8),
        Text(brand, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(name),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
      ],
    ),
  );
}
