import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/quiz/home.dart';
import '../../blocs/auth/bloc/auth_bloc.dart';
import './button_section.dart';
import './option.dart';

class DisplayQuestion extends StatefulWidget {
  final List<Question> questions;

  DisplayQuestion({required this.questions});

  @override
  State<DisplayQuestion> createState() => _DisplayQuestionState();
}

class _DisplayQuestionState extends State<DisplayQuestion> {
  var index = 0;
  var attempted = [];
  var correctAnswer = [];

  void showPreviousQuestion() {
    if (index > 0) {
      setState(() {
        index -= 1;
      });
    }
  }

  void showNextQuestion() {
    if (index < widget.questions.length - 1) {
      setState(() {
        index += 1;
      });
    }
  }

  void onSubmitQuiz(BuildContext context) {
    final wrongAnswer = attempted.length - correctAnswer.length;
    final totalScore = (correctAnswer.length * 1) - (wrongAnswer * 0.25);
    showDialogBox(context, totalScore);
  }

  Future<dynamic> showDialogBox(BuildContext context, double totalScore) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            child: AlertDialog(
              icon: Icon(Icons.alarm_sharp),
              backgroundColor: Color.fromARGB(255, 225, 231, 234),
              content: Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your final score is : $totalScore",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("For detailed information go to result tab.",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600))
                    ],
                  )),
              title: const Text("Quiz Submitted",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              actions: [
                TextButton(
                    onPressed: () {
                      int count = 0;
                      Navigator.of(context).popUntil((route) => count++ >= 2);
                    },
                    child: const Text("Go to Home",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900)))
              ],
            ),
          );
        });
  }

  void optionClicked(String choosedOption) {
    var isQuestionAttempted = attempted.contains(index);
    if (!isQuestionAttempted) {
      attempted.add(index);
      if (widget.questions[index].correctAnswer == choosedOption) {
        correctAnswer.add(index);
      }
    } else {
      if (widget.questions[index].correctAnswer == choosedOption) {
        if (!correctAnswer.contains(index)) {
          correctAnswer.add(index);
        }
      } else {
        if (correctAnswer.contains(index)) {
          correctAnswer.remove(index);
        }
      }
    }
    showNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            'Question ${index + 1} of 10',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonSection(
                nextQuestion: showNextQuestion,
                previousQuestion: showPreviousQuestion,
                submitQuiz: onSubmitQuiz,
              )
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.questions[index].question,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: SizedBox(
            height: 400,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Option(widget.questions[this.index].options[index],
                    index + 1, optionClicked);
              }),
              itemCount: widget.questions[index].options.length,
            ),
          ),
        ),
      ]),
    );
  }
}
