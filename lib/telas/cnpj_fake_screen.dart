import 'package:flutter/material.dart';
import '../api/cnpj_fake_api.dart';
import '../domain/empresa.dart';

class CnpjFakeScreen extends StatefulWidget {
  const CnpjFakeScreen({super.key});

  @override
  State<CnpjFakeScreen> createState() => _CnpjFakeScreenState();
}

class _CnpjFakeScreenState extends State<CnpjFakeScreen> {
  late Future<List<Empresa>> _futureEmpresas;
  final CnpjFakeApi _api = CnpjFakeApi();

  @override
  void initState() {
    super.initState();
    _futureEmpresas = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas - Fake API'),
      ),
      body: FutureBuilder<List<Empresa>>(
        future: _futureEmpresas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final empresas = snapshot.data!;
            return ListView.builder(
              itemCount: empresas.length,
              itemBuilder: (context, index) {
                final empresa = empresas[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${empresa.id ?? '?'}')),
                  title: Text(empresa.razaoSocial),
                  subtitle: Text('CNPJ: ${empresa.cnpj}'),
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
