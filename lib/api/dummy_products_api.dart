import 'package:dio/dio.dart';
import '../domain/produto_dummy.dart';

class DummyProductsApi {
  final Dio _dio = Dio();

  static const String _url = 'https://dummyjson.com/products';

  Future<List<ProdutoDummy>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> data =
          response.data['products'] as List<dynamic>;
      return data
          .map((json) => ProdutoDummy.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar produtos. Status: ${response.statusCode}',
    );
  }
}
