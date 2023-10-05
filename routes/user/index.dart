import 'package:dart_frog/dart_frog.dart';

// Response onRequest(RequestContext context) {
//   // TODO: implement route handler
//   final req = context.request;
//   final params = req.uri.queryParameters;
//   final id = params['id'];
//   // final a = context.read<Map<String, dynamic>>();
//   final a = context.read<Map<String, dynamic>>();
//   // return Response(body: 'ini user dengan id : $id');
//   return Response.json(
//     body: {
//       'User': id ?? 'Kosong',
//       // 'aaa': json.decode(a),
//       'aaa': a,
//     },
//   );
// }

Future<Response> onRequest(RequestContext context) async {
  // TODO: implement route handler
  final req = context.request;
  final params = req.uri.queryParameters;
  final id = params['id'];
  // final a = context.read<Map<String, dynamic>>();
  final a = await context.read<Future<Map<String, dynamic>>>();
  // return Response(body: 'ini user dengan id : $id');
  return Response.json(
    body: {
      'User': id ?? 'Kosong',
      // 'aaa': json.decode(a),
      'aaa': a,
    },
  );
}
