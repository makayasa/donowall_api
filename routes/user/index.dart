import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/user/user_model.dart';

import '_middleware.dart';

Future<Response> onRequest(RequestContext context) async {
  final req = context.request;
  final method = req.method.value;
  if (method != 'GET') {
    return Response(statusCode: 404);
  }

  // final dataUser = await context.read<List<Map>>();
  // final dataUser = await context.readAsync<List<UserModel>>();

  log('method $method');
  // TODO: implement route handler
  // return Response(body: 'This is a new route!');
  return Response.json(
    // body: {'users': dataUser},
    body: {
      'success': 'ok',
    },
    // body: {
    //   'name': 'Makayasa',
    //   'method': method,
    // },
  );
}
