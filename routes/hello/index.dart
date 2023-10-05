import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final req = context.request;
  final method = req.method.value;
  if (method != 'GET') {
    return Response(statusCode: 404);
  }
  log('method $method');
  // TODO: implement route handler
  // return Response(body: 'This is a new route!');
  return Response.json(
    body: {
      'name': 'Makayasa',
      'method': method,
    },
  );
}
