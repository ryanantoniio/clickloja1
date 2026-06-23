import 'package:flutter/material.dart';
import 'package:clickloja1/database/produto_dao.dart';
import 'package:clickloja1/domain/produto.dart';
import 'package:clickloja1/telas/product_detail_screen.dart';

void main() {
  runApp(
    const MaterialApp(home: TelaPesquisa(), debugShowCheckedModeBanner: false),
  );
}

class TelaPesquisa extends StatefulWidget {
  const TelaPesquisa({super.key});

  @override
  State<TelaPesquisa> createState() => _TelaPesquisaState();
}

class _TelaPesquisaState extends State<TelaPesquisa> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Pesquisar...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Produto>>(
        future: ProdutoDao().pesquisarProdutos(_query),
        builder: (context, resultado) {
          if (resultado.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (resultado.hasError) {
            return const Center(child: Text("Erro ao buscar produtos."));
          }

          List<Produto> resultados = resultado.data ?? [];

          if (resultados.isEmpty) {
            return const Center(child: Text("Nenhum produto encontrado."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: resultados.length,
            itemBuilder: (context, index) {
              Produto p = resultados[index];
              return ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(p.titulo),
                subtitle: Text(
                  p.preco,
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

