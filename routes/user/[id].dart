import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/utils/function_utils.dart';

Future<Response> onRequest(RequestContext context, String userId) async {
  // TODO: implement route handler
  final req = context.request;
  logKey('userId', userId);
  return Response.json(
    body: {},
  );
}
