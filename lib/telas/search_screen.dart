import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TelaPesquisa(),
    debugShowCheckedModeBanner: false,
  ));
}

class TelaPesquisa extends StatelessWidget {
  const TelaPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Barra de cima com o campo de texto
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisar roupas...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none, // Remove a linha feia debaixo do texto
          ),
        ),
        backgroundColor: Colors.white,
      ),

      // 2. O corpo da tela com uma lista simples
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            "Sugestões",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10), // Espaço entre o título e a lista

          // Itens da lista (Repita este bloco para criar mais itens)
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Tênis de Corrida"),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Camisa de Time"),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Shorts Térmico"),
          ),
        ],
      ),
    );
  }
}