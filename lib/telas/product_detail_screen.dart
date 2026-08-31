import 'package:flutter/material.dart';

import 'package:clickloja1/domain/produto.dart';
import 'package:clickloja1/database/carrinho_dao.dart';

void main() {
  runApp(
    MaterialApp(
      home: ProductDetailScreen(
        produto: Produto(
          titulo: "Camisa Seleção Brasileira",
          preco: 49.99,
          url: "",
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ProductDetailScreen extends StatelessWidget {
  final Produto produto;

  const ProductDetailScreen({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Produto"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[300],
              child: Image.network(
                produto.url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 100, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              produto.titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 10),
                Text("4.8", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),

            Text(
              'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text("Cor", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 20),
            ),

            const SizedBox(height: 20),

            const Text(
              "Tamanho",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text("M", style: TextStyle(color: Colors.white)),
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await CarrinhoDao().adicionarProdutoCarrinho(produto);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Produto adicionado ao carrinho!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text("Adicionar ao Carrinho"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
