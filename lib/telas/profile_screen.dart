import 'package:flutter/material.dart';
import 'package:clickloja1/database/shared_prefs.dart';
import 'login_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _sair(BuildContext context) async {
    await SharedPrefs().setUserStatus(false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

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
        children: [
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(
              'Usuário Convidado',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Aproveite o ClickLoja!'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Meus Pedidos'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Lista de Desejos'),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('Ajuda e Suporte'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Sair',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => _sair(context),
          ),
        ],
      ),
    );
  }
}
