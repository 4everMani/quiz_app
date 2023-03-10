import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/quiz/calculation.dart';
import '../../models/user.dart';
import './quiz_screen.dart';
import './result_screen.dart';
import '../../widgets/quiz/welcome_note.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.user);

  final User user;

  static const String tabRout = '/tab';

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
            title: WelcomeNote(widget.user.name!),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrangeAccent, Colors.deepPurpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
            bottom: TabBar(
              tabs: const [
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
              ],
              onTap: (value) {
                if (value == 1) {
                  Navigator.of(context).pushNamed(ResultScreen.resultTabUrl,
                      arguments: {'email': widget.user.email});
                }
              },
            ),
          ),
          body: TabBarView(
              children: [QuizScreen(widget.user.email), Calculation()]),
        ));
  }
}
