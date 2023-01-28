import 'dart:convert';

import 'package:quiz_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const String imageUrl =
      'https://media.istockphoto.com/id/1214428300/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=vftMdLhldDx9houN4V-g3C9k0xl6YeBcoB_Rk6Trce0=';

  Future<String> SignUp(User model) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBBgFLRXa6lEViI19dqsWy5alrE75l-b0o';
    final data = {
      'email': model.email,
      'password': model.password,
      'returnSecureToken': true
    };
    final response = await http.post(Uri.parse(url), body: jsonEncode(data));

    if (response.statusCode == 200) {
      return model.name!;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
