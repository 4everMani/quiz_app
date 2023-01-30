import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/style/chart_style.dart';

class Result extends StatelessWidget {
  const Result(
      {required this.correctAnswers,
      required this.questionAttempted,
      required this.topic});
  final int questionAttempted;
  final int correctAnswers;
  final String topic;

  Color getColor(double percentage) {
    if (percentage > 0.9) {
      return Colors.green;
    } else if (percentage > 0.8 && percentage <= 0.9) {
      return Colors.blue;
    } else if (percentage > 0.5 && percentage <= 0.8) {
      return Colors.purple;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 400,
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Colors.blue, Colors.orangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(topic,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w900)),
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 25, left: 40, bottom: 15),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: double.parse(
                              (questionAttempted / 10).toStringAsFixed(2)),
                          center: Text(
                            "${((questionAttempted / 10) * 100).toStringAsFixed(2)} %",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: getColor(double.parse(
                              (questionAttempted / 10).toStringAsFixed(2))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text("Attempt",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 25, left: 30, bottom: 15),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: double.parse(
                              (correctAnswers / questionAttempted)
                                  .toStringAsFixed(2)),
                          center: Text(
                            "${((correctAnswers / questionAttempted) * 100).toStringAsFixed(2)} %",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: getColor(double.parse(
                              (correctAnswers / questionAttempted)
                                  .toStringAsFixed(2))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text("Accuracy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 20),
                    child: const Text("Total Question: 10",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 20),
                    child: Text("Attempted: $questionAttempted",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 20),
                    child: Text("Correct: $correctAnswers",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
