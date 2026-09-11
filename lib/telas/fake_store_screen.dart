import 'package:flutter/material.dart';
import '../api/fake_store_api.dart';
import '../domain/produto_loja.dart';

class FakeStoreScreen extends StatefulWidget {
  const FakeStoreScreen({super.key});

  @override
  State<FakeStoreScreen> createState() => _FakeStoreScreenState();
}

class _FakeStoreScreenState extends State<FakeStoreScreen> {
  late Future<List<ProdutoLoja>> _futureProdutos;
  final FakeStoreApi _api = FakeStoreApi();

  @override
  void initState() {
    super.initState();
    _futureProdutos = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos - Fake Store API'),
      ),
      body: FutureBuilder<List<ProdutoLoja>>(
        future: _futureProdutos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final produtos = snapshot.data!;
            return ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ListTile(
                  leading: Image.network(
                    produto.image,
                    width: 48,
                    height: 48,
                    fit: BoxFit.contain,
                  ),
                  title: Text(produto.title),
                  subtitle: Text(produto.category),
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
