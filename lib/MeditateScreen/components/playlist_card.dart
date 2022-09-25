import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String img, title, author, time;

  const PlaylistCard({
    Key? key,
    required this.img,
    required this.title,
    required this.author,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Image.asset(img),
          width: size.width * 0.4,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                author,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.43,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Text(
                  '♡ ',
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Start >',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
