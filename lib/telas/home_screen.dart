import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClickLoja - Início', style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.white54,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProdutoCard(
            context,
            'Camisa Seleção Brasileira',
            'R\$ 49,99',
            Colors.blueAccent,
          ),
          const SizedBox(height: 16),
          _buildProdutoCard(
            context,
            'Shorts Masculino',
            'R\$ 29,99',
            Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildProdutoCard(BuildContext context, String titulo, String preco, Color cor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(titulo: titulo, preco: preco),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: cor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Center(child: Icon(Icons.image, size: 50, color: Colors.white)),
            ),
            ListTile(
              title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(preco, style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}