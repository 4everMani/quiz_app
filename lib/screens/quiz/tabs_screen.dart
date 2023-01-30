import 'package:flutter/material.dart';
import './quiz_screen.dart';
import './result_screen.dart';
import '../../widgets/quiz/welcome_note.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.name);

  final String name;

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
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            title: WelcomeNote(widget.name),
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
          body: TabBarView(children: [QuizScreen(), ResultScreen()]),
        ));
  }
}
