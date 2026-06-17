import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      // Adicionado os parâmetros obrigatórios aqui
      home: ProductDetailScreen(
        titulo: "Camisa Seleção Brasileira",
        preco: "R\$ 49,99",
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ProductDetailScreen extends StatelessWidget {
  // 1. Declarar as variáveis finais na classe
  final String titulo;
  final String preco;

  const ProductDetailScreen({
    super.key,
    // 2. Usar 'this.titulo' e 'this.preco' no construtor
    required this.titulo,
    required this.preco,
  });

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
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // 3. (Opcional) Usar a variável 'titulo' aqui em vez de texto fixo
            Text(
              titulo,
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

            // 4. (Opcional) Usar a variável 'preco' aqui em vez de texto fixo
            Text(
              preco,
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
                onPressed: () {},
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
