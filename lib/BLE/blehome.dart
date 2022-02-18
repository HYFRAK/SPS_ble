import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'bldeventry.dart';
import 'detailpage.dart';

class BLEHomePage extends StatefulWidget {
  const BLEHomePage({Key? key}) : super(key: key);

  @override
  State<BLEHomePage> createState() => _BLEHomePageState();
}

class _BLEHomePageState extends State<BLEHomePage> with WidgetsBindingObserver {
  BluetoothState bstate = BluetoothState.UNKNOWN;
  List<BluetoothDevice> blelist = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    getStateb();
    statechangelistner();
    listpairedev();
  }

  void getStateb() {
    FlutterBluetoothSerial.instance.state.then((state) {
      bstate = state;
      if (bstate.isEnabled) listpairedev();
      setState(() {});
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  statechangelistner() {
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      bstate = state;
      print("Current State : ${state.isEnabled}");
      if (bstate.isEnabled) {
        listpairedev();
      } else {
        blelist.clear();
      }
      setState(() {});
    });
  }

  listpairedev() {
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> value) {
      blelist = value;
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state.index == 0) {
      if (bstate.isEnabled) listpairedev();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPS BLE LL"),
      ),
      body: Container(
        child: Column(
          children: [
            SwitchListTile(
                title: const Text("Switch BLE on"),
                value: bstate.isEnabled,
                onChanged: (bool val) {
                  future() async {
                    if (val) {
                      await FlutterBluetoothSerial.instance.requestEnable();
                    } else {
                      await FlutterBluetoothSerial.instance.requestDisable();
                    }
                  }

                  future().then((value) {
                    setState(() {});
                  });
                }),
            ListTile(
              title: const Text("BLE STAT"),
              subtitle: Text(bstate.toString()),
              trailing: InkWell(
                child: const Icon(Icons.settings),
                onTap: () {
                  FlutterBluetoothSerial.instance.openSettings();
                },
              ),
            ),
            Expanded(
                child: ListView(
              children: blelist
                  .map((e) => BluetoothDeviceListEntry(
                        device: e,
                        enabled: true,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(server: e);
                          }));
                        },
                      ))
                  .toList(),
            ))
          ],
        ),
      ),
    );
  }
}
