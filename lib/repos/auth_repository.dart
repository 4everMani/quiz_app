import 'dart:convert';
import 'package:quiz_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const String imageUrl =
      'https://media.istockphoto.com/id/1214428300/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=vftMdLhldDx9houN4V-g3C9k0xl6YeBcoB_Rk6Trce0=';

  /// Signup method
  Future<User> signUp(User model) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBBgFLRXa6lEViI19dqsWy5alrE75l-b0o';
    final data = {
      'email': model.email,
      'password': model.password,
      'returnSecureToken': true
    };
    final response = await http.post(Uri.parse(url), body: jsonEncode(data));

    if (response.statusCode == 200) {
      final user = await saveUser(model);
      return user;
    } else {
      throw Exception({
        'message': response.reasonPhrase,
        'status code': response.statusCode
      });
    }
  }

  /// Login method
  Future<User> login(User model) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBBgFLRXa6lEViI19dqsWy5alrE75l-b0o';
    final data = {
      'email': model.email,
      'password': model.password,
      'returnSecureToken': true
    };

    final response = await http.post(Uri.parse(url), body: jsonEncode(data));

    if (response.statusCode == 200) {
      final user = await getUser(model.email);
      return user;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  /// Save user method
  Future<User> saveUser(User user) async {
    const url =
        'https://quiz-app-2fb27-default-rtdb.asia-southeast1.firebasedatabase.app/users.json';
    user.imageUrl = imageUrl;

    final data = {
      'email': user.email,
      'password': user.password,
      'imageUrl': imageUrl,
      'mobileNo': '',
      'name': user.name
    };
    final response = await http.post(Uri.parse(url), body: jsonEncode(data));
    if (response.statusCode == 200) {
      return user;
    } else {
      throw Exception({
        'message': response.reasonPhrase,
        'status code': response.statusCode
      });
    }
  }

  /// getUser method
  Future<User> getUser(String email) async {
    final url =
        'https://quiz-app-2fb27-default-rtdb.asia-southeast1.firebasedatabase.app/users.json?orderBy="email"&equalTo="${email}"';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final output = jsonDecode(response.body);
      final userInfo = User(email: '', password: '');
      output.forEach((key, value) {
        userInfo.email = value['email'];
        userInfo.password = value['password'];
        userInfo.name = value['name'];
        userInfo.imageUrl = value['imageUrl'];
        userInfo.mobileNo = value['mobileNo'];
      });
      return userInfo;
    } else {
      throw Exception({
        'message': response.reasonPhrase,
        'status code': response.statusCode
      });
    }
  }
}
