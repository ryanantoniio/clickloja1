import 'package:dio/dio.dart';
import '../domain/cnpj_info.dart';

class CnpjApi {
  final Dio _dio = Dio();

  static const String _baseUrl = 'https://brasilapi.com.br/api/cnpj/v1';

  Future<CnpjInfo> buscar(String cnpj) async {
    final Response response = await _dio.get('$_baseUrl/$cnpj');

    if (response.statusCode == 200) {
      return CnpjInfo.fromJson(response.data as Map<String, dynamic>);
    }

    throw Exception(
      'Falha ao consultar CNPJ. Status: ${response.statusCode}',
    );
  }
}
