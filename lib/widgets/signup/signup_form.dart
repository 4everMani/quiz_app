import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:quiz_app/models/user.dart';
import '../../../constants.dart';
import '../../screens/welcome/already_have_an_account.dart';
import '../login/login.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final signup =
        User(name: name.text, email: email.text, password: password.text);
    final authContext = BlocProvider.of<AuthBloc>(context);
    authContext.add(SignUpEvent(signup));
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: name,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              validator: ((value) {
                if (value == '') {
                  return 'Please enter your name.';
                }
                return null;
              }),
              decoration: const InputDecoration(
                hintText: "Your Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            controller: email,
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
                child: Icon(Icons.email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: password,
              validator: ((value) {
                if (value == null || value.length < 4) {
                  return 'Password is too short!.';
                }
                return null;
              }),
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              _submit(context);
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccount(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: authBloc,
                    child: const Login(),
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
