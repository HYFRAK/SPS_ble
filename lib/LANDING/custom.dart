import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/common.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';

class CustomMode extends StatefulWidget {
  CustomMode({Key? key}) : super(key: key);

  @override
  State<CustomMode> createState() => _CustomModeState();
}

class _CustomModeState extends State<CustomMode> {
  final seqlist = [
    'Custom Sequence',
    'Random',
    'Coach',
    'Memory',
    'Infinite',
    'Deception',
    'Right Bias',
    'Left Bias'
  ];
  final placelist = [
    'Corner',
    'Random',
    '3R 3L',
    '3F',
    'Center',
  ];
  final aidlist = [
    'All Light',
    'All Sound',
    'Front Light, Back Sound',
    'All Light and Sound',
  ];
  String seqdropdownvalue = "Random";
  String placedropdownvalue = "3R 3L";
  String aiddropdownvalue = "All Light";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double leftpadd = 12;
    return Scaffold(
      floatingActionButton: bluetoothfloater(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://images.unsplash.com/photo-1547941126-3d5322b218b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.black45,
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: const [
                  BackButton1(),
                  Text(
                    "Custom Mode",
                    style: TitleStyle1,
                  ),
                  ProfileButton()
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: leftpadd,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Your Sequence Pattern",
                    style: Body0Style,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: leftpadd,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.black,
                      value: seqdropdownvalue,
                      onChanged: (newValue) {
                        setState(() {
                          seqdropdownvalue = newValue.toString();
                        });
                      },
                      items: seqlist
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: Body1Style,
                              )))
                          .toList()),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: leftpadd,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Your Placement Pattern",
                    style: Body0Style,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: leftpadd,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.black,
                      value: placedropdownvalue,
                      onChanged: (newValue) {
                        setState(() {
                          placedropdownvalue = newValue.toString();
                        });
                      },
                      items: placelist
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: Body1Style,
                              )))
                          .toList()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: leftpadd,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Your Aid Pattern",
                    style: Body0Style,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: leftpadd,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.black,
                      value: aiddropdownvalue,
                      onChanged: (newValue) {
                        setState(() {
                          aiddropdownvalue = newValue.toString();
                        });
                      },
                      items: aidlist
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: Body1Style,
                              )))
                          .toList()),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
