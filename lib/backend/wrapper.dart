//Wrapper for One Time Login
import 'package:else_thesis_final_build/backend/user.dart';
import 'package:else_thesis_final_build/screen/home.dart';
import 'package:else_thesis_final_build/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
        stream: authentication.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? const LogInUI() : const HomeUI();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
