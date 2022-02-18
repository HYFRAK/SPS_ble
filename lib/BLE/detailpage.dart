import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.server}) : super(key: key);
  final BluetoothDevice server;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late BluetoothConnection connection;
  bool isConnecting = true;
  bool get isConnected => connection.isConnected;
  bool checkComplete = false;
  bool isDisconnecting = false;

  @override
  void initState() {
    getBTcon();
    super.initState();
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
    }
    super.dispose();
  }

  void getBTcon() async {
    await BluetoothConnection.toAddress(widget.server.address).then((value) {
      connection = value;
      checkComplete = true;
      isConnecting = false;
      isDisconnecting = false;
      setState(() {
        connection.input!.listen(onDataRec).onDone(() {
          if (isDisconnecting) {
            print("Is Disconnecting");
          } else {
            print("Not Disconnecting Yet");
          }
          if (mounted) {
            setState(() {});
          }
          Navigator.of(context).pop(context);
        });
      });
    }).catchError((error) {
      Navigator.of(context).pop(context);
    });
  }

  void onDataRec(Uint8List) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.server.name ?? "SPS"),
      ),
      body: SafeArea(
        child: checkComplete
            ? Column(
                children: [
                  Text(widget.server.address),
                  Text(widget.server.name!),
                  Text(widget.server.type.toString()),
                ],
              )
            : const Text(
                "Connecting",
                style: TextStyle(),
              ),
      ),
    );
  }
}
