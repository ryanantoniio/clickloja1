import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clickloja1/database/produto_dao.dart';
import 'package:clickloja1/domain/produto.dart';
import 'package:clickloja1/telas/product_detail_screen.dart';

class TelaPesquisa extends StatefulWidget {
  const TelaPesquisa({super.key});

  @override
  State<TelaPesquisa> createState() => _TelaPesquisaState();
}

class _TelaPesquisaState extends State<TelaPesquisa> {
  final ProdutoDao _dao = ProdutoDao();
  late Future<List<Produto>> _futureResultados;
  Timer? _debounce;
  String _query = '';

  @override
  void initState() {
    super.initState();
    // Carrega estado inicial (lista vazia ou todos os produtos)
    _futureResultados = _dao.pesquisarProdutos(_query);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    // Cancela o timer anterior antes de criar um novo
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _query = value;
        _futureResultados = _dao.pesquisarProdutos(_query);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _onSearchChanged,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Pesquisar...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Produto>>(
        future: _futureResultados,
        builder: (context, resultado) {
          if (resultado.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (resultado.hasError) {
            return const Center(child: Text("Erro ao buscar produtos."));
          }

          final List<Produto> resultados = resultado.data ?? [];

          if (resultados.isEmpty) {
            return const Center(child: Text("Nenhum produto encontrado."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: resultados.length,
            itemBuilder: (context, index) {
              final Produto p = resultados[index];
              return ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(p.titulo),
                subtitle: Text(
                  'R\$ ${p.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(produto: p),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
