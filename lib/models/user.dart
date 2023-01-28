import 'package:quiz_app/widgets/signup/signup.dart';

class User {
  String? name;
  String email;
  String password;
  String? imageUrl;

  User({this.name, required this.email, required this.password, this.imageUrl});
}
