import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/utils/server/database_config.dart';
import 'package:hive/hive.dart';

Future<void> init(InternetAddress ip, int port) async {
  final db = DatabaseConfig.instance;
  // await Hive.openBox('token');
  Hive.init('./');

  print('before ${db.isConnect}');
  await db.initDatabase();
  print('after ${db.isConnect}');
  db.initServer('init hehe');
  print('init print');
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler, ip, port);
}

