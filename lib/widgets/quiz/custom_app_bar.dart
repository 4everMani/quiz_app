import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
      ),
    );
  }
}
