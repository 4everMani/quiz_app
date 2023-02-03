import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/widgets/picker/user_image_picker.dart';
import 'package:quiz_app/widgets/quiz/custom_app_bar.dart';

import '../models/user.dart';

class Profile extends StatelessWidget {
  const Profile(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    var imagePath = user.imageUrl ?? '';
    return Scaffold(
      appBar:
          const CustomAppBar(title: "Profile", automaticallyImplyLeading: true),
      body: Column(
        children: [
          UserImagePicker(imagePath),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 80),
            child: Row(
              children: [
                const Text(
                  "Name : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(user.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 80),
            child: Row(
              children: [
                const Text(
                  "Email : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(user.email,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 80),
            child: Row(
              children: [
                const Text(
                  "MobileNo : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                user.mobileNo != null
                    ? Text(user.mobileNo!, style: const TextStyle(fontSize: 20))
                    : const TextButton(
                        onPressed: null,
                        child: Text(
                          "Add",
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
