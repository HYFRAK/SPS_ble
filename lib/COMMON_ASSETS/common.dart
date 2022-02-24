import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sps_ble/BLE/blehome.dart';
import 'package:sps_ble/LANDING/profile.dart';

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

class bluetoothfloater extends StatelessWidget {
  const bluetoothfloater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      //foregroundColor: Colors.transparent,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BLEHomePage()));
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: const BoxDecoration(
          image: DecorationImage(
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
