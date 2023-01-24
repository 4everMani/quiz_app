import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option(this.option, this.code);

  final String option;

  final int code;

  String get optionCode {
    switch (code) {
      case 1:
        {
          return "A";
        }
      case 2:
        {
          return "B";
        }
      case 3:
        {
          return "C";
        }
      case 4:
        {
          return "D";
        }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        height: 60,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(2),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  optionCode,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  option,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}