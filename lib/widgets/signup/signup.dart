import 'package:flutter/material.dart';
import './signup_top_image.dart';
import './signup_form.dart';
import '../../screens/welcome/background.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SignUpTopImage(),
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 8,
                child: SignUpForm(),
              ),
              Spacer(),
            ],
          ),
          // const SocalSignUp()
        ],
      )),
    );
  }
}
