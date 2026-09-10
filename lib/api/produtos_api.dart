import 'package:dio/dio.dart';
import '../domain/produto.dart';

class ProdutosApi {
  final Dio _dio = Dio();

  static const String _url =
      'https://my-json-server.typicode.com/ryanantoniio/clickloja-fake-api/produtos';

  Future<List<Produto>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => Produto.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar produtos. Status: ${response.statusCode}',
    );
  }
}
