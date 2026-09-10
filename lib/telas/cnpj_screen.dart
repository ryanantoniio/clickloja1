import 'package:flutter/material.dart';
import '../api/cnpj_api.dart';
import '../domain/cnpj_info.dart';

class CnpjScreen extends StatefulWidget {
  const CnpjScreen({super.key});

  @override
  State<CnpjScreen> createState() => _CnpjScreenState();
}

class _CnpjScreenState extends State<CnpjScreen> {
  // CNPJ de exemplo: Banco do Brasil
  static const String _cnpjExemplo = '00000000000191';

  late Future<CnpjInfo> _futureCnpj;
  final CnpjApi _api = CnpjApi();

  @override
  void initState() {
    super.initState();
    _futureCnpj = _api.buscar(_cnpjExemplo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CNPJ - BrasilAPI'),
      ),
      body: FutureBuilder<CnpjInfo>(
        future: _futureCnpj,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final info = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem('CNPJ', info.cnpj),
                  _buildItem('Razão Social', info.razaoSocial),
                  _buildItem('Nome Fantasia', info.nomeFantasia),
                  _buildItem('Situação', info.descricaoSituacaoCadastral),
                  _buildItem('Natureza Jurídica', info.naturezaJuridica),
                  _buildItem('Atividade (CNAE)', info.cnaeDescricao),
                  _buildItem('Início das Atividades', info.dataInicioAtividade),
                  _buildItem('Capital Social', 'R\$ ${info.capitalSocial.toStringAsFixed(2)}'),
                  const Divider(),
                  _buildItem('Logradouro', '${info.logradouro}, ${info.numero}'),
                  _buildItem('Complemento', info.complemento),
                  _buildItem('Bairro', info.bairro),
                  _buildItem('Cidade/UF', '${info.municipio} - ${info.uf}'),
                  _buildItem('CEP', info.cep),
                  const Divider(),
                  if (info.dddTelefone1 != null)
                    _buildItem('Telefone 1', info.dddTelefone1!),
                  if (info.dddTelefone2 != null)
                    _buildItem('Telefone 2', info.dddTelefone2!),
                  if (info.email != null)
                    _buildItem('E-mail', info.email!),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(value.isEmpty ? '-' : value, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
