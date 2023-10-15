import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/utils/function_utils.dart';
import 'package:donowall/utils/server/database_config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

void main() async {
  // await getUserByEmail('');
  print('tess');
  final db = DatabaseConfig.instance;
  await db.initDatabase();
  final user = await db.getUserByEmail('janesmith@example.com');
  if (user == null) {
    logKey('user not found');
    return;
  }
  // print('user', user.toJson());
  logKey('${user.name}', user.email);
  // group('GET /', () {
  //   test('responds with a 200 and "Welcome to Dart Frog!".', () {
  //     final context = _MockRequestContext();
  //     final response = route.onRequest(context);
  //     expect(response.statusCode, equals(HttpStatus.ok));
  //     expect(
  //       response.body(),
  //       completion(equals('Welcome to Dart Frog!')),
  //     );
  //   });
  // });
}
