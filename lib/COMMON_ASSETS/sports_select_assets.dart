import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sps_ble/COMMON_ASSETS/styles.dart';

class SportsSelectBox extends StatelessWidget {
  final String text, url, info;
  final Widget x;
  const SportsSelectBox(
      {Key? key, required this.text, required this.url, required this.info, required this.x})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => x)) ,
      child: Container(
        padding: EdgeInsets.only(left: 15, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                height: 100,
                width: 150,
                child: CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Head2Style,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    info,
                    style: Body2Style,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
