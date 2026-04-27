import 'package:flutter/material.dart';
// lista global para guardar itens dentro do carrinho
List<Map<String, dynamic>> carrinhoGlobal = [];

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // aqui verifica se o carrinho ta vazio
      body: carrinhoGlobal.isEmpty
      ? Center(
        // se sim, mostra a tela de vazio
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text('Seu carrinho está vazio.', style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      )
          : ListView.builder(
        // se nao estiver vazio, faz a lista
        padding: const EdgeInsets.all(16),
        itemCount: carrinhoGlobal.length,
        itemBuilder: (context, index) {
          // pega o item especifico da lista
          final item = carrinhoGlobal[index];

          return Card(
            margin: const EdgeInsets.only(bottom :12),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
              title: Text(item['titulo'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Quantidade: ${item['quantidade']}'),
              trailing: Text(item['preco'], style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          );
        }
      ),
    );
  }
}