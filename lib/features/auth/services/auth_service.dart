//  it is creted in order to seperate ui part with business Logics(),
import "package:http/http.dart" as http;
import 'package:amazonclone/models/user.dart';

import '../../../constants/global_variables.dart';

class AuthService {
  // signup the user

  void signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse("$uri/api.signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );

      // catching error from our client side is not the issue but the issue is we have to catch it from our auth.js file in

    } catch (e) {}
  }
}
