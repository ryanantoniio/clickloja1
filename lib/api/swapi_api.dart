import 'package:dio/dio.dart';
import '../domain/personagem.dart';

class SwapiApi {
  final Dio _dio = Dio();

  static const String _url = 'https://swapi.dev/api/people/';

  Future<List<Personagem>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> results =
          response.data['results'] as List<dynamic>;
      return results
          .map((json) => Personagem.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar personagens. Status: ${response.statusCode}',
    );
  }
}
