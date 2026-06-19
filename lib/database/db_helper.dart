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
      version: 2,
      onCreate: onCreateDB,
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE IF EXISTS PRODUTO');
        await db.execute('DROP TABLE IF EXISTS CARRINHO');
        await onCreateDB(db, newVersion);
      },
    );

    String sqlCarrinho = '''
      CREATE TABLE IF NOT EXISTS CARRINHO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        preco TEXT NOT NULL,
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
        titulo TEXT,
        preco TEXT NOT NULL,
        url TEXT
      );
    ''';
    await db.execute(sql);

    String sqlCarrinho = '''
      CREATE TABLE CARRINHO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        preco TEXT NOT NULL,
        url TEXT
      );
    ''';
    await db.execute(sqlCarrinho);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Camisa Seleção Brasileira','R\$ 49,99', 'https://images.tcdn.com.br/img/img_prod/1044362/camisa_futebol_brasil_copa_do_mundo_2026_ii_torced_1_20260115102624_75150200e531.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Shorts Masculino','R\$ 29,99','https://images.tcdn.com.br/img/img_prod/680475/shorts_moletom_no_future_cinza_5022_4_b4c80e165a1a84c891c85760070f28ce_20230614160803.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Smartphone Galaxy S23','R\$ 3.999,00','https://images.samsung.com/is/image/samsung/p6pim/br/2302/gallery/br-galaxy-s23-s911-sm-s911bzkpzto-534839845?\$650_519_PNG\$');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('LEGO Star Wars','R\$ 899,90','https://m.media-amazon.com/images/I/81U41i-KIfL._AC_SL1500_.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Produto (titulo, preco, url) VALUES ('Tênis Nike Air Force 1','R\$ 799,99','https://imgnike-a.akamaihd.net/768x768/01113751.jpg');";
    await db.execute(sql);
  }
}
