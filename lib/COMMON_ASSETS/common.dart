import 'package:flutter/material.dart';
import 'package:sps_ble/BLE/blehome.dart';

class CommonAppbar extends StatelessWidget {
  final String texts;
  const CommonAppbar({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [BluetoothButton(), Text("SPS"), Icon(Icons.person)],
      ),
    );
  }
}

class BluetoothButton extends StatelessWidget {
  const BluetoothButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.bluetooth),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BLEHomePage()));
      },
    );
  }
}
