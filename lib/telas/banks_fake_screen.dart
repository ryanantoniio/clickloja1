import 'package:flutter/material.dart';
import '../api/banks_fake_api.dart';
import '../domain/banco.dart';

class BanksFakeScreen extends StatefulWidget {
  const BanksFakeScreen({super.key});

  @override
  State<BanksFakeScreen> createState() => _BanksFakeScreenState();
}

class _BanksFakeScreenState extends State<BanksFakeScreen> {
  late Future<List<Banco>> _futureBancos;
  final BanksFakeApi _api = BanksFakeApi();

  @override
  void initState() {
    super.initState();
    _futureBancos = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bancos - Fake API'),
      ),
      body: FutureBuilder<List<Banco>>(
        future: _futureBancos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bancos = snapshot.data!;
            return ListView.builder(
              itemCount: bancos.length,
              itemBuilder: (context, index) {
                final banco = bancos[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${banco.id ?? '?'}')),
                  title: Text(banco.nome),
                  subtitle: Text('Código: ${banco.codigo}'),
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
