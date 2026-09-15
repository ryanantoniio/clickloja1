import 'package:dio/dio.dart';
import '../domain/produto_loja.dart';

class FakeStoreApi {
  final Dio _dio = Dio();

  static const String _url = 'https://fakestoreapi.com/products';

  Future<List<ProdutoLoja>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => ProdutoLoja.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar produtos Status: ${response.statusCode}',
    );
  }
}
