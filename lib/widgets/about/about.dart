import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../quiz/custom_app_bar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: "About App", automaticallyImplyLeading: true),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 15),
              child: const Text(
                "A quiz app to test your knowledge.",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
              ),
            ),
            const Text(
              "Quiz topic includes Dart, JavaScript, DotNet & NodeJs.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Features : ",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                "=> Firebase is used as server",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> Login / Signup using Firebase Auth",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> User can update their profile picture.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> Questions are stored at Firebase Db.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> User can take multiple quiz.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> Quiz results are stored at Firebase Db.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> User details are stored at Firebase Db.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "=> Results are display using graphics.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Github Repository : ",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "https://github.com/4everMani/quiz_app.git",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
