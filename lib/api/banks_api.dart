import 'package:dio/dio.dart';
import '../domain/banco.dart';

class BanksApi {
  final Dio _dio = Dio();

  static const String _url = 'https://brasilapi.com.br/api/banks/v1';

  Future<List<Banco>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => Banco.fromBrasilApi(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar bancos. Status: ${response.statusCode}',
    );
  }
}
