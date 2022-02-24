import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/common.dart';
import 'package:sps_ble/COMMON_ASSETS/login_assets.dart';
import 'package:sps_ble/COMMON_ASSETS/sports_select_assets.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';

class SportSelect extends StatelessWidget {
  SportSelect({Key? key}) : super(key: key);
  final Map sportbar = {
    "Custom":
        "https://images.unsplash.com/photo-1609513677385-5d2b049d9431?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "Cricket":
        "https://images.unsplash.com/photo-1590134674840-96ce3d0f9766?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "Racket Sports":
        "https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "Warm up mode":
        "https://images.unsplash.com/photo-1608138278545-366680accc66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "Custom1":
        "https://images.unsplash.com/photo-1609513677385-5d2b049d9431?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  };
  final Map sportinfo = {
    "Custom":
        "Create your own modes with custom parmeters designed for your needs.",
    "Cricket":
        "Stamina booster and batsmen training modes designed by expert coaches.",
    "Racket Sports":
        "Stamina booster and swing training modes designed specially for racket sports by experts.",
    "Warm up mode":
        "Training and HIIT excercise boosters designed by expert trainers.",
    "Custom1":
        "Training and HIIT excercise boosters designed by expert trainers."
  };
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: bluetoothfloater(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://images.unsplash.com/photo-1502014822147-1aedfb0676e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.black54,
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [ProfileButton()],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Select Your Sport...",
                style: Head1Style,
              ),
              Text(
                "Pick a mode that best defines your requirement",
                style: Body1Style,
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //padding: EdgeInsets.only(left: 15, right: 15),
                children: sportbar.keys
                    .map((e) => SportsSelectBox(
                          text: e,
                          url: sportbar[e],
                          info: sportinfo[e],
                        ))
                    .toList(),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
