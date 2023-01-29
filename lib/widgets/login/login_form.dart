import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';
import '../../blocs/auth/bloc/auth_bloc.dart';
import '../../models/user.dart';
import '../../screens/welcome/already_have_an_account.dart';
import '../signup/signup.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  final email = TextEditingController();

  final password = TextEditingController();

  void startLoginProcess(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final user = User(email: email.text, password: password.text);
    final authContext = BlocProvider.of<AuthBloc>(context);
    authContext.add(LogInEvent(user));
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: email,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            validator: ((value) {
              if (value == null || !value.contains('@')) {
                return 'Incorrect email.';
              }
              return null;
            }),
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: password,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                startLoginProcess(context);
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccount(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: authBloc,
                    child: const SignUp(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
