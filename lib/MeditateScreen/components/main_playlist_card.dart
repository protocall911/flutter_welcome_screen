import 'package:flutter/material.dart';

class MainPlaylistCard extends StatelessWidget {
  const MainPlaylistCard({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Image.asset('assets/images/img_sun_lune.png'),
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
                'A Song of Moon',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Start with the basics',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.86,
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
                  '9 Sessions',
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