import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/user/user_model.dart';
import 'package:donowall/utils/function_utils.dart';

import '_middleware.dart';

Future<Response> onRequest(RequestContext context) async {
  final req = context.request;
  final method = req.method.value;
  if (method != 'GET' && method != 'POST') {
    return Response(statusCode: 404);
  }
  final greeting = context.read<String>();
  final a = context.read<int>();
  logKey('anjir',a);
  logKey('greeting',greeting);
  // final dataUser = await context.read<List<Map>>();

  log('method $method');
  // TODO: implement route handler
  return Response(body: greeting.toString());
  // return Response.json(
    // body: {'users': dataUser},
    // body: {
    //   'name': 'Makayasa',
    //   'method': method,
    // },
  // );
}
