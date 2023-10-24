//ignore_for_file:invalid_assignment
import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:donowall/middleware/authenticator.dart';
import 'package:donowall/models/http_status.dart';
import 'package:donowall/models/signin/signin_model.dart';
import 'package:donowall/models/user/user_model.dart';
import 'package:donowall/utils/function_utils.dart';
import 'package:donowall/utils/server/database_config.dart';

Handler middleware(Handler handler) {
  return (context) async {
    final req = context.request;
    final method = req.method.value;
    final stringBody = await req.body();
    var res = await handler(context);
    if (method != 'POST') {
      res = Response(statusCode: HttpStatus.notFound, body: 'Not found');
    }
    Map<String, dynamic> body = json.decode(stringBody);
    var _body = SigninModel.fromJson(body);
    final token = await signIn(_body.email, _body.password);
    if (token == null) {
      return Response(statusCode: HttpStatus.notFound, body: 'User not found');
    }
    // handler.use(
    //   provider<String>((context) => token),
    // );
    // return res;
    return Response.json(
      body: {
        'status': 'success',
        'token': token,
      },
    );
  };
  return handler;
}

Future<String?> signIn(String email, String password) async {
  final db = DatabaseConfig.instance;
  final res = await db.getUserByEmail(email);
  if (res == null) {
    return null;
  }
  // logKey('res db', res);
  final token = generateJwt(res);

  // logKey('token', token);
  await db.insertToken(res.uuid, token);
  return token;
  // provider<UserModel>((context) => res);
}

String generateJwt(UserModel user) {
  final data = {
    'name': user.name,
    'email': user.email,
  };
  final timeStamp = DateTime.timestamp().toString();
  final jwt = JWT(data, header: {'date_time': timeStamp});
  final sign = jwt.sign(
    SecretKey('asadasan123'),
    expiresIn: const Duration(seconds: 10),
  );
  final verify = JWT.verify(sign, SecretKey('asadasan123'));
  logKey('verify', verify.payload);
  return sign;
}
