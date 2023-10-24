// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
//ignore_for_file: argument_type_not_assignable

import 'package:donowall/models/user/user_model.dart';
import 'package:donowall/utils/function_utils.dart';
import 'package:postgres/postgres.dart';

class DatabaseConfig {
  DatabaseConfig._();
  static final DatabaseConfig _instance = DatabaseConfig._();
  static DatabaseConfig get instance => _instance;

  var connection = PostgreSQLConnection(
    'localhost',
    5432,
    'donowall',
    username: 'postgres',
    password: 'asadasan123',
  );

  bool isConnect = false;

  void initServer(String args) {
    print('init server $args');
  }

  Future<void> initDatabase() async {
    try {
      final res = await connection.open();
      print('initDatabase => ${res}');
      isConnect = true;
    } catch (e) {
      print('error $e');
    }
  }

  Future<void> createUserTable() async {
    final query = ''' CREATE TABLE "User" (
    uuid UUID PRIMARY KEY,
    nama VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);''';
    try {
      final res = await connection.query(query);
      logKey('res createUserTable', res);
    } on PostgreSQLException catch (e) {
      logKey('error createUserTable', e.toString());
      // logKey('error createUserTable ${e.response?.statusCode}', e.response?.data);
    }
  }

  Future<List<UserModel>> getAllUser() async {
    // final query = '''SELECT * FROM "User"''';
    final query = ''' SELECT
      uuid AS "uuid",
      nama AS "name",
      email AS "email",
      password AS "password"
    FROM "user";
    ''';
    try {
      // final res = await connection.query(query);
      final res = await connection.mappedResultsQuery(query);
      final temp = <UserModel>[];
      // logKey('res', res);
      for (final element in res) {
        final data = UserModel.fromJson(element['user']!);
        temp.add(data);
      }
      return temp;
      logKey('res createUserTable', temp);
    } on PostgreSQLException catch (e) {
      logKey('error createUserTable', e.toString());
      return [];
      // logKey('error createUserTable ${e.response?.statusCode}', e.response?.data);
    }
  }

  Future<void> insertUser(args) async {}

  Future<UserModel?> getUserByEmail(String email) async {
    final query = '''SELECT * FROM "user" WHERE email = '$email'; ''';
    try {
      final rawUser = await connection.mappedResultsQuery(query);
      // logKey('_user', _user);
      if (rawUser.isEmpty) {
        return null;
      }
      final user = rawUser.first['user'];
      final userModel = UserModel.fromJson(user!);
      return userModel;
    } on PostgreSQLException catch (e) {
      logKey('error getUserByEmail', e.message);
      return null;
    }
  }

  Future<void> insertToken(String userUUid, String token) async {
    final query = ''' INSERT INTO token (uuid, token, user_uuid, expired_date) 
    VALUES 
      (uuid_generate_v4(), '$token', '$userUUid', CURRENT_TIMESTAMP + INTERVAL '1 week'); ''';
    try {
      final result = await connection.mappedResultsQuery(query);
      logKey('inserToken', result);
    } on PostgreSQLException catch (e) {
      logKey('error inserToken', e);
    }
  }
}
