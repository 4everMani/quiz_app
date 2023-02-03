import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/models/user.dart';

import '../../blocs/auth/bloc/auth_bloc.dart';

class WelcomeNote extends StatelessWidget {
  final String name;
  const WelcomeNote(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 25, bottom: 15),
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hello',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            name.split(' ')[0],
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
