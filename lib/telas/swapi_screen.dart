import 'package:flutter/material.dart';
import '../api/swapi_api.dart';
import '../domain/personagem.dart';

class SwapiScreen extends StatefulWidget {
  const SwapiScreen({super.key});

  @override
  State<SwapiScreen> createState() => _SwapiScreenState();
}

class _SwapiScreenState extends State<SwapiScreen> {
  // Exibe apenas a primeira página (10 personagens) — sem paginação automática
  late Future<List<Personagem>> _futurePersonagens;
  final SwapiApi _api = SwapiApi();

  @override
  void initState() {
    super.initState();
    _futurePersonagens = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SWAPI - Personagens')),
      body: FutureBuilder<List<Personagem>>(
        future: _futurePersonagens,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final personagens = snapshot.data!;
            return ListView.builder(
              itemCount: personagens.length,
              itemBuilder: (context, index) {
                final p = personagens[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(p.nome),
                  subtitle: Text(
                    'Altura: ${p.altura} cm  •  Massa: ${p.massa} kg  •  Nascimento: ${p.anascimento}',
                  ),
                  trailing: Text(
                    p.genero,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
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
