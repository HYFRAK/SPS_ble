import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';
import 'package:sps_ble/LANDING/custom.dart';




class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      "Login",
      style: ButtonStyle1,
    ));
  }
}
