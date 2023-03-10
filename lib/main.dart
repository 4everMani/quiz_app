import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:quiz_app/repos/auth_repository.dart';
import 'package:quiz_app/screens/quiz/result_screen.dart';
import 'package:quiz_app/screens/quiz/tabs_screen.dart';
import 'package:quiz_app/widgets/login/login.dart';
import 'package:quiz_app/widgets/quiz/home.dart';
import './screens/quiz/question_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'widgets/error-display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(AuthRepository())..add(LoadAuthScreenEvent()),
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(builder: ((context, state) {
          final authBloc = BlocProvider.of<AuthBloc>(context);
          if (state is LoadAuthScreenState) {
            return const WelcomeScreen();
          }
          if (state is LoggedInState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: authBloc,
                      child: const Home(),
                    ),
                  ));
            });
          }
          if (state is AuthErrorState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: ErrorDisplay(state.message)));
            });
          }
          if (state is LogOutState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: authBloc,
                      child: const Login(),
                    ),
                  ));
            });
          }
          return Container();
        })),
      ),
      routes: {
        // '/': (ctx) => const CategoriesScreen(),
        WelcomeScreen.url: (ctx) => const WelcomeScreen(),
        ResultScreen.resultTabUrl: (ctx) => ResultScreen(),
        Home.homeRoute: (ctx) => Home(),
        QuestionScreen.routeName: (ctx) => QuestionScreen(),
      },
    );
  }
}
