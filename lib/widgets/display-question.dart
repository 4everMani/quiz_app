import 'package:flutter/cupertino.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/button_section.dart';
import 'package:quiz_app/widgets/option.dart';

class DisplayQuestion extends StatefulWidget {
  final List<Question> questions;

  DisplayQuestion({required this.questions});

  @override
  State<DisplayQuestion> createState() => _DisplayQuestionState();
}

class _DisplayQuestionState extends State<DisplayQuestion> {
  var index = 0;

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

  void onSubmitQuiz() {
    if (index < widget.questions.length - 1) {
      setState(() {
        index += 1;
      });
    }
  }

  void optionClicked() {
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
            'Question Count: ${index + 1} / 10',
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
