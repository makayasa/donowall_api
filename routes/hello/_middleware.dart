import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:donowall/middleware/authenticator.dart';
import 'package:donowall/middleware/get_userdata.dart';
import 'package:donowall/utils/function_utils.dart';
import 'package:donowall/utils/server/database_config.dart';

Handler middleware(Handler handler) {
  // TODO: implement middleware
  // final db = DatabaseConfig.instance;

  return handler.use(authenticator()).use(testInt());

  // return (context) async {
  //   final respone = await handler(context);
  //   return respone;
  // };
}

Middleware greetingProvider() {
  return provider<String>((context) => 'Hello World');
}

Middleware testProvider() {
  return provider<dynamic>((context) => 'tes asd');
}

Middleware testInt() {
  return provider<int>((context) => 69);
}

Middleware mainHandler() {
  return (handler) {
    return (context) async {
      // Execute code before request is handled.
      // Forward the request to the respective
      // handler.print("methods type before ${context.request.method}");
      final a = context.read<int>();
      logKey('before', a);
      final response = await handler(context);
      final b = context.read<String>();
      logKey('after', b);
      print("methods type after ${context.request.method}");
      // Execute code after request is handled.
      // Return a response.
      return response;
    };
  };
}
