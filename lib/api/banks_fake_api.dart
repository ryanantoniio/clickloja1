import 'package:dio/dio.dart';
import '../domain/banco.dart';

class BanksFakeApi {
  final Dio _dio = Dio();

  static const String _url =
      'https://my-json-server.typicode.com/ryanantoniio/clickloja-fake-api/produtos_banks';

  Future<List<Banco>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => Banco.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar bancos. Status: ${response.statusCode}',
    );
  }
}
