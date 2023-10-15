import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/http_status.dart';

Future<Response> onRequest(RequestContext context) async {
  return Response(body: 'This is a new route!');
}
