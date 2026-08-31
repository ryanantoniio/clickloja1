import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'clickloja1';

    String dbPath = join(path, dbName);

    Database db = await openDatabase(
      dbPath,
      version: 5,
      onCreate: onCreateDB,
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE IF EXISTS PRODUTO');
        await db.execute('DROP TABLE IF EXISTS CARRINHO');
        await db.execute('DROP TABLE IF EXISTS USER');
        await onCreateDB(db, newVersion);
      },
    );

    String sqlCarrinho = '''
      CREATE TABLE IF NOT EXISTS CARRINHO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        preco REAL NOT NULL,
        url TEXT
      );
    ''';
    await db.execute(sqlCarrinho);

    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''
      CREATE TABLE PRODUTO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        preco REAL NOT NULL,
        url TEXT
      );
    ''';
    await db.execute(sql);

    String sqlCarrinho = '''
      CREATE TABLE CARRINHO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        preco REAL NOT NULL,
        url TEXT
      );
    ''';
    await db.execute(sqlCarrinho);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Camisa Seleção Brasileira', 49.99, 'https://images.tcdn.com.br/img/img_prod/1044362/camisa_futebol_brasil_copa_do_mundo_2026_ii_torced_1_20260115102624_75150200e531.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Shorts Masculino', 29.99, 'https://imgcentauro-a.akamaihd.net/1024x1024/97319703A2.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Smartphone Galaxy S23', 3999.00, 'https://a-static.mlcdn.com.br/280x210/usado-samsung-galaxy-s23-5g-256gb-verde-bom-trocafone/trocafone/97269/435ebe6ee69e1e1c33612d185a6baa76.jpeg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('LEGO Star Wars', 899.90, 'https://m.media-amazon.com/images/I/71jRnJ0W2CL.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Tênis Nike Air Force 1', 799.99, 'https://imgnike-a.akamaihd.net/768x768/01113751.jpg');";
    await db.execute(sql);

    String sqlUser = '''
      CREATE TABLE USER (
        username TEXT PRIMARY KEY,
        password TEXT
      );
    ''';
    await db.execute(sqlUser);

    await db.execute(
        "INSERT INTO USER (username, password) VALUES ('teste@gmail.com', '123456');");
  }
}
