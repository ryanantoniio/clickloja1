import 'package:flutter/material.dart';
import 'produtos_screen.dart';
import 'banks_screen.dart';
import 'banks_fake_screen.dart';
import 'fake_store_screen.dart';
import 'dummy_products_screen.dart';
import 'users_fake_screen.dart';

class ApisScreen extends StatelessWidget {
  const ApisScreen({super.key});

  void _navegar(BuildContext context, Widget tela) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APIs', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // ── Ryan ─────────────────────────────────────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Ryan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
                fontSize: 13,
              ),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Fake Store API'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegar(context, const FakeStoreScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Usuários (Fake API)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegar(context, const UsersFakeScreen()),
          ),
          // ── Guilherme ────────────────────────────────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Guilherme',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
                fontSize: 13,
              ),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.inventory_2),
            title: const Text('DummyJSON Products'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegar(context, const DummyProductsScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Bancos (Fake API)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegar(context, const BanksFakeScreen()),
          ),
          // ── Wallisson ────────────────────────────────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Wallisson',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
                fontSize: 13,
              ),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Bancos (BrasilAPI)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegar(context, const BanksScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.storefront),
            title: const Text('Produtos (Fake API)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegar(context, const ProdutosScreen()),
          ),
        ],
      ),
    );
  }
}
