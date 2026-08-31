import 'package:flutter/material.dart';
import 'package:clickloja1/database/carrinho_dao.dart';
import 'package:clickloja1/domain/produto.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<Produto>> _futureCarrinho;
  final CarrinhoDao _dao = CarrinhoDao();

  @override
  void initState() {
    super.initState();
    _carregarCarrinho();
  }

  void _carregarCarrinho() {
    _futureCarrinho = _dao.listarCarrinho();
  }

  Future<void> _removerItem(int id) async {
    await _dao.remover(id);
    setState(() {
      _carregarCarrinho();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu Carrinho',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Produto>>(
        future: _futureCarrinho,
        builder: (context, resultado) {
          if (resultado.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (resultado.hasError) {
            return const Center(child: Text("Erro ao carregar o carrinho."));
          }

          final List<Produto> produtos = resultado.data ?? [];

          if (produtos.isEmpty) {
            return const Center(child: Text("Seu carrinho está vazio."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final Produto p = produtos[index];
              return _buildCartItem(p.titulo, p.preco, p.url, p.id);
            },
          );
        },
      ),
    );
  }

  Widget _buildCartItem(String titulo, double preco, String url, int? id) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Botão de remoção do item
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                if (id != null) {
                  _removerItem(id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

}
