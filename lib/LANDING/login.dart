import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/login_assets.dart';
import 'package:sps_ble/LANDING/sports_select.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Solipsist"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.3,
              ),
              const Text("Login to your SolipsistOne Account"),
              SizedBox(
                height: height * 0.0147,
              ),
              const EmailArea(),
              const PassArea(),
              SizedBox(
                height: height * 0.027,
              ),
              GestureDetector(
                child: const LoginButton(),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SportSelect();
                  }));
                },
              ),
              SizedBox(
                height: height * 0.27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Forgot Password"), Text("Contact Us")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
