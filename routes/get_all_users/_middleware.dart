import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/middleware/get_userdata.dart';
import 'package:donowall/utils/server/database_config.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(getUserData());
  return handler;
}
