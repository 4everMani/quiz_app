import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/welcome_note.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const WelcomeNote(),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrangeAccent, Colors.deepPurpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.topic),
                text: 'Quiz',
              ),
              Tab(
                icon: Icon(Icons.score),
              )
            ]),
          ),
          body: const TabBarView(children: [QuizScreen(), ResultScreen()]),
        ));
  }
}
