import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/tabs_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
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
          body: const TabsScreen()),
      routes: {
        // '/': (ctx) => const CategoriesScreen(),
        QuestionScreen.routeName: (ctx) => QuestionScreen(),
      },
    );
  }
}
