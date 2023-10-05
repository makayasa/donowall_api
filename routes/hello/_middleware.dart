import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/function_utils.dart';

Handler middleware(Handler handler) {
  // TODO: implement middleware
  logKey('testing asdasd');
  return handler;
}
