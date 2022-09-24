import 'package:flutter/material.dart';

class TrackCard extends StatelessWidget {
  final String img, title,date, icon;

  const TrackCard({
    Key? key,
    required this.img,
    required this.title,
    required this.date,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(img),
            ),
            SizedBox(
              width: 13,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  date,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Image(
              image: AssetImage(icon),
            ),
          ],
        ),
      ],
    );
  }
}