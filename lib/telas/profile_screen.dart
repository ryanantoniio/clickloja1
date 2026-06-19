import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Usuário Convidado', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Aproveite o ClickLoja!'),
          ),
          Divider(),
          ListTile(leading: Icon(Icons.shopping_bag), title: Text('Meus Pedidos')),
          ListTile(leading: Icon(Icons.favorite), title: Text('Lista de Desejos')),
          ListTile(leading: Icon(Icons.help), title: Text('Ajuda e Suporte')),
        ],
      ),
    );
  }
}
