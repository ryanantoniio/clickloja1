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

  double _calcularTotal(List<Produto> produtos) {
    return produtos.fold(0.0, (total, p) {
      final valor = double.tryParse(
            p.preco.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim(),
          ) ??
          0.0;
      return total + valor;
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

          final double total = _calcularTotal(produtos);

          return Column(
            children: [
              // ── Lista de itens ──────────────────────────────────────────
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    final Produto p = produtos[index];
                    return Dismissible(
                      key: Key('produto_${p.id}_$index'),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) {
                        if (p.id != null) {
                          _removerItem(p.id!);
                        }
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
                      ),
                      child: _buildCartItem(p.titulo, p.preco, p.url, p.id),
                    );
                  },
                ),
              ),

              // ── Rodapé com total e botão ────────────────────────────────
              _buildFooter(total),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItem(String titulo, String preco, String url, int? id) {
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
                    preco,
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

  Widget _buildFooter(double total) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: implementar finalização da compra
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Finalizar Compra',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
