import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/widgets/profile.dart';
import 'package:quiz_app/widgets/quiz/info.dart';

import '../../blocs/auth/bloc/auth_bloc.dart';
import '../../models/user.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen(this.user);

  final User user;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Drawer(
      width: 154,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            Info(widget.user),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 25,
                color: Colors.white,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: authBloc,
                        child: Profile(widget.user),
                      ),
                    ),
                  )),
            ),
            const ListTile(
              leading: Icon(
                Icons.info,
                size: 25,
                color: Colors.white,
              ),
              title: Text(
                "About",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onTap: null,
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onTap: (() => _logout()),
            ),
          ],
        ),
      ),
    );
  }

  _logout() {
    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
  }
}
