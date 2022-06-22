//  it is creted in order to seperate ui part with business Logics(),
// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:amazonclone/constants/errorhandling.dart';
import 'package:amazonclone/constants/utils.dart';
import 'package:amazonclone/features/auth/home/homescreen.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:amazonclone/models/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_variables.dart';

class AuthService {
  //!  signup the user

  void signUpUser({
    required BuildContext context,
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
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );

      // catching error from our client side is not the issue but the issue is we have to catch it from our auth.js file in

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          showSnackBar(context, "Account Created Login with same Credentials");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // User user = User(
      //     id: '',
      //     name: '',
      //     email: email,
      //     password: password,
      //     address: '',
      //     type: '',
      //     token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          // body: user.toJson(),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () async {
            // SetStrings implemeted

            //! Shared Preferences geting instances
            SharedPreferences prefs = await SharedPreferences.getInstance();

            //!Provider i.e userProvider
            // Settings User
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);

            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// ! Get user data

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);
      // TokenIsValid is supplying us booleans value so we check

      if (response==true) {
        // Get user data

        

      
      }

    } catch (e) {}
  }
}
