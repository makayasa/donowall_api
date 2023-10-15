import 'package:dart_frog/dart_frog.dart';
import 'package:donowall/models/user/user_model.dart';
import 'package:donowall/utils/function_utils.dart';

Future<Response> onRequest(RequestContext context) async {
  final dataUser = await context.readAsync<List<UserModel>>();
  return Response.json(
    body: {
      'length': dataUser.length,
      'users': dataUser,
    },
  );
}
