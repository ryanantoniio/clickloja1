import 'package:dio/dio.dart';
import '../domain/user.dart';

class UserApi {
  final Dio _dio = Dio();

  static const String _url =
      'https://my-json-server.typicode.com/ryanantoniio/clickloja-fake-api/users';

  /// Busca a lista de usuários da fake API e verifica se existe um usuário
  /// com [username] e [password] correspondentes.
  /// Retorna true se as credenciais forem válidas.
  Future<bool> login(String username, String password) async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> users = response.data as List<dynamic>;
      return users.any((u) =>
          u['username'] == username && u['password'] == password);
    }

    throw Exception(
      'Falha ao autenticar. Status: ${response.statusCode}',
    );
  }

  Future<List<User>> listar() async {
    final Response response = await _dio.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      'Falha ao carregar usuários. Status: ${response.statusCode}',
    );
  }
}
