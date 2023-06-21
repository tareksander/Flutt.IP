import 'package:flutter/material.dart';

class LoginAuthSelectPage extends StatelessWidget {
  const LoginAuthSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Login"),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const SingleChildScrollView(
                //child: ,
                )));
  }
}
