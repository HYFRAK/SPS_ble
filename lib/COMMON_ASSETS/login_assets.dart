import 'package:flutter/material.dart';

class EmailArea extends StatelessWidget {
  const EmailArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      autofillHints: ["Email", "Username"],
      decoration:
          InputDecoration(hintText: "Enter your registered email or username"),
    );
  }
}

class PassArea extends StatelessWidget {
  const PassArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      autofillHints: ["Password"],
      obscureText: true,
      decoration: InputDecoration(hintText: "Enter your password"),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Login"));
  }
}
