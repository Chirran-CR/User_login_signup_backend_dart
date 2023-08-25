import 'package:mysql_client/mysql_client.dart';
import 'package:server/error/not_font_exeption.dart';

class MySql {
  factory MySql() {
    return _inst;
  }
  MySql._internal() {
    _connect();
  }
  MySQLConnection? _connection;
  static final MySql _inst = MySql._internal();

  Future<void> _connect() async {
    // _connection = await MySQLConnection.createConnection(
    //   host: '127.0.0.1',
    //   port: 3306,
    //   userName: 'root',
    //   password: 'root',
    //   databaseName: 'test1',
    // );
    _connection = await MySQLConnection.createConnection(
      host: 'bjuyzxavpq0gjvb5pp7w-mysql.services.clever-cloud.com',
      port: 3306,
      userName: 'uarkmy64y5klgst7',
      password: 'b60cNaCJ6Wbfp2CvdreB',
      databaseName: 'bjuyzxavpq0gjvb5pp7w',
    );
    await _connection?.connect();
  }

  Future<IResultSet> execute(
    String query, {
    Map<String, dynamic>? params,
  }) async {
    if (_connection == null) {
      await _connect();
    }
    try {
      final result = await _connection!.execute(query, params);
      return result;
    } catch (e) {
      print(e);
      throw DatabaseExeption(e.toString(), 400);
    }
  }
}
