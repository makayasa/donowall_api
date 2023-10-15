import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/user/user_model.dart';
import 'package:donowall/utils/server/database_config.dart';

Middleware getUserData() {
  final db = DatabaseConfig.instance;

  return provider<Future<List<UserModel>>>((context) async {
    final dataUser = await db.getAllUser();
    return dataUser;
  });
}
