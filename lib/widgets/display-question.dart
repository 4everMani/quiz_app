import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/button_section.dart';
import 'package:quiz_app/widgets/option.dart';

class DisplayQuestion extends StatefulWidget {
  DisplayQuestion({super.key});

  final questionNumber = 1;
  final question = Question(
      "Full form of JS", ["JS1", "JS2", "JS3", "JavaScript"], "JavaScript");

  @override
  State<DisplayQuestion> createState() => _DisplayQuestionState();
}

class _DisplayQuestionState extends State<DisplayQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 30, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ButtonSection()],
          ),
        ),
        Row(
          children: [
            Text(
              '${widget.questionNumber}) ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
            Text(
              widget.question.question,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 400,
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return Option(widget.question.options[index], index + 1);
            }),
            itemCount: widget.question.options.length,
          ),
        ),
      ]),
    );
  }
}
