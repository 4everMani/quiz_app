import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/user.dart';

class Info extends StatelessWidget {
  const Info(this.user);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: Column(
        children: [
          user.imageUrl!.contains('http')
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.imageUrl!),
                )
              : CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(File(user.imageUrl!)),
                ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text(
                  user.name!.contains(' ')
                      ? user.name!.split(' ')[0]
                      : user.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  user.name!.contains(' ') ? user.name!.split(' ')[1] : '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
