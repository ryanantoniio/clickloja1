import 'package:flutter/material.dart';
import '../api/dummy_products_api.dart';
import '../domain/produto_dummy.dart';

class DummyProductsScreen extends StatefulWidget {
  const DummyProductsScreen({super.key});

  @override
  State<DummyProductsScreen> createState() => _DummyProductsScreenState();
}

class _DummyProductsScreenState extends State<DummyProductsScreen> {
  late Future<List<ProdutoDummy>> _futureProdutos;
  final DummyProductsApi _api = DummyProductsApi();

  @override
  void initState() {
    super.initState();
    _futureProdutos = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos - Dummy JSON'),
      ),
      body: FutureBuilder<List<ProdutoDummy>>(
        future: _futureProdutos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            final produtos = snapshot.data!;
            return ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ListTile(
                  leading: Image.network(
                    produto.thumbnail,
                    width: 48,
                    height: 48,
                    fit: BoxFit.contain,
                  ),
                  title: Text(produto.title),
                  subtitle: Text(produto.brand ?? 'Sem marca'),
                  trailing: Text(
                    'R\$ ${produto.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
