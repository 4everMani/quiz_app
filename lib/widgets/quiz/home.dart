import 'package:flutter/material.dart';

import '../../screens/quiz/tabs_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String homeRoute = './home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const TabsScreen(),
    );
  }
}
