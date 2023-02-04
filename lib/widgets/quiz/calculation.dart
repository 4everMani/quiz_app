import 'package:flutter/material.dart';

class Calculation extends StatelessWidget {
  const Calculation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 15),
      child: Card(
        elevation: 5,
        color: Color.fromARGB(255, 239, 241, 243),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Score Calculation",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 25),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Maximum question available per quiz : 10",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "For each right answer : 1 mark",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "For each wrong answer : -0.25 mark",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Total = no. of correct anser - 0.25*(no. of wrnong answer)",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Attempt % = Total question attempted / 10",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Accuracy % = Total correct answer / Total question attempted",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
