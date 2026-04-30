import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'O que você procura?',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Itens em destaque',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.book), title: Text('A metamorfose - Franz Kafka')),
                  ListTile(leading: Icon(Icons.tv), title: Text("Monitor 24' AOC")),
                  ListTile(leading: Icon(Icons.checkroom), title: Text('Camisa Brasil Masculina')),
                  ListTile(leading: Icon(Icons.headphones), title: Text('Fone Bluetooth Phillips')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}