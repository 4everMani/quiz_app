import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/screens/quiz/drawer_screen.dart';

import '../../blocs/auth/bloc/auth_bloc.dart';
import '../../models/user.dart';
import '../../screens/quiz/tabs_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String homeRoute = './home';

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).state.props[0] as User;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is ImageChangeState) {
          user.imageUrl = state.imagePath;
        }
        return Scaffold(
          // drawer: DrawerScreen(user),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("Quiz App"),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
          ),
          body: TabsScreen(user.name!),
        );
      },
    );
  }
}
