import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/user_model.dart';

class AuthService {
  List<User> _users = [];

  Future<void> loadUsers() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        String contents = await file.readAsString();
        List<dynamic> jsonList = jsonDecode(contents);
        _users = jsonList.map((json) => User.fromJson(json)).toList();
      }
    } catch (e) {
      print("Error loading users: $e");
    }
  }

  Future<void> saveUsers() async {
    try {
      final file = await _getLocalFile();
      String jsonData = jsonEncode(_users.map((user) => user.toJson()).toList());
      await file.writeAsString(jsonData);
    } catch (e) {
      print("Error saving users: $e");
    }
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/users.json');
  }

  bool register(String name, String email, String password) {
    if (_users.any((user) => user.email == email)) {
      return false;
    }

    User newUser = User(name: name, email: email, password: password);
    _users.add(newUser);
    saveUsers();
    return true;
  }

  bool login(String email, String password) {
    return _users.any((user) => user.email == email && user.password == password);
  }
}
