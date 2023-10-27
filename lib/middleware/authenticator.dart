import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:donowall/models/user/user_model.dart';
import 'package:donowall/utils/function_utils.dart';
import 'package:donowall/utils/server/database_config.dart';

import '../models/http_status.dart';

Middleware authenticator() {
  // final db = DatabaseConfig.instance;

  // final jwt = JWT({"nama": "makayasa", "email": "rifqimakayasa@gmail.com"});

  // return (handler) => (context) async {
  //   return Response();
  // };

  // return (handler) => (context) async  {
  //   return handler.
  // };

  // return provider<String>((context) {
  //   final userModel = context.read<UserModel>();
  //   logKey('usermodel authenticator', userModel);
  //   // final theJwt = jwt.sign(SecretKey('asdasd'));
  //   // logKey('theJwt', theJwt);

  //   const token =
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hIjoibWFrYXlhc2EiLCJlbWFpbCI6InJpZnFpbWFrYXlhc2FAZ21haWwuY29tIiwiaWF0IjoxNjk3MjA0NDU3fQ.x_32zuJykTsrP2TP4AgbUSG1zg1i8j-JEj9e0KDSjbs';
  //   final verivy = JWT.verify(token, SecretKey('asdasd'));
  //   logKey('verivy', verivy.payload);
  //   return '';
  // });

  return (handler) => (context) async {
        final req = context.request;
        final header = req.headers;
        final token = header['authorization']?.split(' ').last;
        logKey('token', token);
        if (token != null) {
          checkSession(token: token);
        }

        return Response(
          statusCode: HttpStatus.unauthorized,
        );
      };

  // return provider<Future<List<UserModel>>>((context) async {
  // final dataUser = await db.getAllUser();
  // return dataUser;
  // });

  // bearerAuthentication()
}

// ({String token, bool isExist})
void checkSession({required String token}) async {
  final db = DatabaseConfig.instance;
  await db.checkToken(token);
}
