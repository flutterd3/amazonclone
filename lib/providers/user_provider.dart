import 'package:amazonclone/models/user.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');

// above model is private so we cant get it from outside so we make getter function whick make us to get that private user functions
  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
