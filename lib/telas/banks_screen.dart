import 'package:flutter/material.dart';
import '../api/banks_api.dart';
import '../domain/banco.dart';

class BanksScreen extends StatefulWidget {
  const BanksScreen({super.key});

  @override
  State<BanksScreen> createState() => _BanksScreenState();
}

class _BanksScreenState extends State<BanksScreen> {
  late Future<List<Banco>> _futureBancos;
  final BanksApi _api = BanksApi();

  @override
  void initState() {
    super.initState();
    _futureBancos = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bancos - BrasilAPI'),
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
                  leading: CircleAvatar(child: Text(banco.codigo.isEmpty ? '?' : banco.codigo)),
                  title: Text(banco.nome),
                  subtitle: banco.nomeCompleto != null
                      ? Text(banco.nomeCompleto!)
                      : null,
                  trailing: banco.ispb != null
                      ? Text(banco.ispb!, style: const TextStyle(fontSize: 11, color: Colors.grey))
                      : null,
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
