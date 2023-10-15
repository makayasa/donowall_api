import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/utils/function_utils.dart';
import 'package:donowall/utils/server/database_config.dart';
import 'package:logging/logging.dart';

Future<void> init(InternetAddress ip, int port) async {
  final db = DatabaseConfig.instance;

  print('before ${db.isConnect}');
  await db.initDatabase();
  print('after ${db.isConnect}');
  db.initServer('init hehe');
  print('init print');
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler, ip, port);
}

