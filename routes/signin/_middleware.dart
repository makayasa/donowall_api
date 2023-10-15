import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/http_status.dart';
import 'package:donowall/utils/server/database_config.dart';

Handler middleware(Handler handler) {
  return (context) async {
    final req = context.request;
    final method = req.method.value;
    final body = await req.body();
    

    var res = await handler(context);
    if (method != 'POST') {
      res = Response(statusCode: HttpStatus.notFound, body: 'Not found');
    }
    return res;
  };
  return handler;
}


void signIn(String email, String password) {
  final db = DatabaseConfig.instance;
  
}