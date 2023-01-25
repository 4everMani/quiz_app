import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  final Function() nextQuestion;
  final Function() previousQuestion;
  final Function() submitQuiz;
  const ButtonSection(
      {required this.nextQuestion,
      required this.previousQuestion,
      required this.submitQuiz});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      // color: Color.fromARGB(255, 237, 85, 199),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(225, 112, 105, 105),
            Color.fromARGB(255, 62, 63, 65)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (() => previousQuestion()),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            TextButton(
                onPressed: (() => submitQuiz()),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            IconButton(
                onPressed: (() => nextQuestion()),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
