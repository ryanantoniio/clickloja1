import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String titulo;
  final String preco;

  const ProductDetailScreen({Key? key, required this.titulo, required this.preco}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int corSelecionada = 0;
  int tamanhoSelecionado = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Center(child: Icon(Icons.image, size: 100, color: Colors.grey)),
            ),
            const SizedBox(height: 16),

            Text(widget.titulo, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star_half, color: Colors.amber, size: 20),
                SizedBox(width: 8),
                Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),

            Text(widget.preco, style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            const Text('Cor', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: (){
                // aqui avisamos ao flutter que essa cor foi clicada
                setState(() { corSelecionada = 0; });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle, // deixa redondo
                    // caso seja selecionado cria uma borda
                    border: corSelecionada == 0
                        ? Border.all(color: Colors.blue, width: 2)
                        : null,
                  ),
                  child: corSelecionada == 0
                      ? const Icon(Icons.check, color: Colors.white)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text('Tamanho', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() { tamanhoSelecionado = 1; });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center, // Centraliza a letra "M"
                  decoration: BoxDecoration(
                    // Se selecionado, fundo roxo. Se não, fundo branco.
                    color: tamanhoSelecionado == 1 ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(12), // Deixa as pontas redondas
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    'M',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // Se selecionado, letra branca. Se não, letra preta.
                      color: tamanhoSelecionado == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(), // Empurra o botão lá para o final da tela

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
              },
              child: const Text('Adicionar ao Carrinho', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}