import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/common.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';
import 'package:sps_ble/LANDING/login.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final auth = FirebaseAuth.instance;
    return Scaffold(
      floatingActionButton: bluetoothfloater(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://images.unsplash.com/photo-1483721310020-03333e577078"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.black54,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [BackButton1()],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                children: [
                  Text(
                    "Hi, " + auth.currentUser!.email.toString(),
                    style: Head1Style,
                  ),
                  Text(
                    "Customize the app based on your needs",
                    style: Body1Style,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              GestureDetector(
                onTap: () {
                  auth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Sign Out",
                  style: Body1Style,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
