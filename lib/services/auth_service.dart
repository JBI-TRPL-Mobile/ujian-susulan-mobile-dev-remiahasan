import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class AuthService {
  List<UserModel> _users = [];

  Future<void> loadUsers() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final List<dynamic> data = json.decode(response);
    _users = data.map((user) => UserModel.fromJson(user)).toList();
  }

  bool login(String email, String password) {
    return _users.any((user) => user.email == email && user.password == password);
  }
}
