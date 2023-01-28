import 'package:flutter/material.dart';
import './quiz_screen.dart';
import './result_screen.dart';
import '../../widgets/quiz/welcome_note.dart';

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
            automaticallyImplyLeading: false,
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
                child: Text(
                  'Quiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Tab(
                icon: Icon(Icons.score),
                child: Text(
                  'Scores',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ]),
          ),
          body: const TabBarView(children: [QuizScreen(), ResultScreen()]),
        ));
  }
}
