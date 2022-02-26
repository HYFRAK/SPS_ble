import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sps_ble/BLE/blehome.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';
import 'package:sps_ble/LANDING/profile.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [UserProfilePage()],
      ),
    );
  }
}

class bluetoothfloater extends StatefulWidget {
  bluetoothfloater({Key? key}) : super(key: key);

  @override
  State<bluetoothfloater> createState() => _bluetoothfloaterState();
}

class _bluetoothfloaterState extends State<bluetoothfloater> {
  void statechanger() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //splashColor: Colors.white,
      backgroundColor: Colors.transparent,
      //foregroundColor: Colors.transparent,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BLEHomePage()));
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent.withOpacity(0.4),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
          image: const DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://www.pikpng.com/pngl/b/284-2842487_amazon-dot-rd-gen-amazon-echo-dot-3rd.png")),
          shape: BoxShape.circle,
        ),
        //child: //Center(child: Icon(Icons.bluetooth)),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserProfilePage();
        }));
      },
      child: Icon(
        Icons.person_outline,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class BackButton1 extends StatelessWidget {
  const BackButton1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

class ColorPalletes extends StatefulWidget {
  ColorPalletes({Key? key}) : super(key: key);

  @override
  State<ColorPalletes> createState() => _ColorPalletesState();
}

class _ColorPalletesState extends State<ColorPalletes> {
  Color pickerColor = const Color(0xffff3a49);
  Color currentColor = const Color(0xffff3a49);

  void changeColor(color) {
    setState(() {
      currentColor = color;
      pickerColor = color;
    });
  }

  void showcolor() {
    Navigator.push(
        context,
        DialogRoute(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.transparent,
                title: ColorPicker(
                    labelTypes: const [],
                    pickerColor: pickerColor,
                    enableAlpha: false,
                    onColorChanged: changeColor),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showcolor,
        child: Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 25,
                width: 50,
                color: currentColor,
              )
            ],
          ),
        ));
  }
}
