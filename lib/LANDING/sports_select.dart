import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/common.dart';

class SportSelect extends StatelessWidget {
  const SportSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonAppbar(texts: 'SPS',),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(left: 15, right: 15),
        crossAxisCount: 2,
        children: const [
          Text("Warm up mode"),
          Text("Racket Sports"),
          Text("Cricket"),
          Text("Custom")
        ],
      ),
    );
  }
}
