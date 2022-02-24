import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sps_ble/COMMON_ASSETS/login_assets.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';
import 'package:sps_ble/LANDING/custom.dart';
import 'package:sps_ble/LANDING/profile.dart';
import 'package:sps_ble/LANDING/sports_select.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email, _pass;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Welcome to Solipsist"),
      ),*/
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://images.unsplash.com/photo-1608138403974-95b81bf5dd05"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.black54,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.44,
                ),
                const Text(
                  "Login to your SolipsistOne Account",
                  style: Head1Style,
                ),
                SizedBox(
                  height: height * 0.022,
                ),
                TextField(
                  style:  Body1Style,
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                  autofillHints: const ["Email", "Username"],
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.sports_tennis,
                        color: Colors.redAccent,
                      ),
                      hintText: "Enter your registered email or username",
                      hintStyle: Body1Style),
                ),
                TextField(
                  style:  Body1Style,
                  onChanged: (value) {
                    setState(() {
                      //print(value);
                      _pass = value.trim();
                    });
                  },
                  autofillHints: const ["Password"],
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.password_sharp,
                        color: Colors.redAccent,
                      ),
                      hintText: "Enter your password",
                      hintStyle: Body1Style),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                GestureDetector(
                    child: const LoginButton(),
                    onTap: () {
                      signin(_email, _pass);
                    }),
                SizedBox(
                  height: height * 0.1,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Forgot Password",
                        style: Body2Style,
                      ),
                      Text(
                        "Contact Us",
                        style: Body2Style,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void signin(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _pass);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return SportSelect();
      }));
    } on FirebaseAuthException catch (error) {
      //print(error.message);
      Fluttertoast.showToast(
          msg: error.message ?? "Something Went Wrong! Please Try Again.",
          gravity: ToastGravity.CENTER);
    }
  }
}
