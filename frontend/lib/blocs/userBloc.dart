import 'dart:async';
import 'package:frontend/resources/apiProvider.dart';
import 'package:frontend/repository/userRepository.dart';
import 'package:frontend/classes/user.dart';

class UserBloc {
  UserRepository _userRepo = UserRepository();
  
  registerUser(String username, String password, String firstname, String lastname, String email) async {
    User user = await _userRepo.registerUser(username, password, firstname, lastname, email);
  }

  loginUser(String email, String password) {
    User user = await _userRepo.loginUser(email, password);
  }


}