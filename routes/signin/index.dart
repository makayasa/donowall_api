import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/http_status.dart';

Future<Response> onRequest(RequestContext context) async {
  // final token = context.read<String>();
  return Response.json(
      // body: {
      //   'status': 'success',
      //   'body': token,
      // },
      );
}
