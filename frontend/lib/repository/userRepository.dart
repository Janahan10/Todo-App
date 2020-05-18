import 'package:frontend/resources/apiProvider.dart';
import 'package:frontend/classes/user.dart';
import 'dart:async';

class UserRepository {
  ApiProvider _provider = ApiProvider();

  Future<User> registerUser(String username, String password, String firstname, String lastname, String email) =>
    _provider.post(username, password, firstname, lastname, email);
  
}


