import 'package:clickloja1/database/db_helper.dart';
import 'package:clickloja1/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  /// Verifica se existe um usuário com o username e password informados.
  /// Usa query parametrizada com "?" para evitar SQL Injection.
  /// Retorna true se as credenciais forem válidas.
  Future<bool> login(String username, String password) async {
    Database db = await DBHelper().initDB();

    var result = await db.query(
      'USER',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return result.isNotEmpty;
  }

  /// Insere um novo usuário na tabela USER.
  Future<void> save(User user) async {
    Database db = await DBHelper().initDB();

    await db.insert('USER', user.toJson());
  }
}
