import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/middleware/authenticator.dart';
import 'package:donowall/models/http_status.dart';
import 'package:donowall/utils/function_utils.dart';

Handler middleware(Handler handler) {
  final data = {'Nama': 'Makayasa', 'id': ''};
  // // TODO: implement middleware
  // return handler;

  // return (context) async {
  //   final response = await handler(context);
  //   print(data);
  //   return response;
  // };

  // return handler.use(provider<String>((context) => json.encode(data)));
  // return handler.use(provider<Map<String, dynamic>>((context) => data));
  return handler.use(authenticator());
  // return handler.use(provider<dynamic>((context) => data));

  // return handler.use(
  //   provider<Map<String, dynamic>>(
  //     (context) => data,
  //   ),
  // );

  // return handler.use(asyncGreetingProvider());
}

Middleware greetingProvider() {
  // return provider<String>((context) => 'Hello World');
  var data = {'Nama': 'Makayasa', 'id': ''};
  return provider<Map<String, dynamic>>((context) {
    final res = context.request;
    final id = res.uri.queryParameters['id'];
    data['id'] = id ?? 'Null';
    return data;
  });
}

Middleware asyncGreetingProvider() {
  var data = {'Nama': 'Makayasa', 'id': ''};
  return provider<Future<Map<String, dynamic>>>((context) async {
    // await Future.delayed(Duration(seconds: 5));
    logKey('zxczxc');
    final res = context.request;
    final id = res.uri.queryParameters['id'];
    data['id'] = id ?? 'kosong';
    return data;
  });
}

Middleware testBlock() {
  return (handler) => (context) async {
        return Response(
          statusCode: HttpStatus.unauthorized,
        );
      };
}
