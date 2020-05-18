import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:frontend/classes/user.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Client client = Client();

  final String _baseURL = "http://10.0.2.2:5000/api/Users";

  Future<User> post(String username, String password, String firstname, String lastname, String email) async {
    var data = {
      "username" : username,
      "password" : password,
      "firstname" : firstname,
      "lastname" : lastname, 
      "email" : email
    };
    final response = await http.post(
      _baseURL,
      body: json.encode(data)
    );
    
    final Map result = json.decode(response.body);
    print(result);
    if (response.statusCode == 201) {
      return User.fromJson(result['data']);
    } else {
      print(response.statusCode);
      throw Exception('Failed to load');
    }

  }
    
}