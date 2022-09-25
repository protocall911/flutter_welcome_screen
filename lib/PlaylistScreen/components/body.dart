import 'package:flutter/material.dart';
import 'package:welcome_screen/MeditateScreen/meditate_screen.dart';
import 'package:welcome_screen/PlaylistScreen/components/track_card.dart';
import 'package:welcome_screen/main.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Image.asset("assets/images/top_image.png",
              width: size.width * 0.9),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Peter Mach',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Mind Deep Relax',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        kPlayNextSessionButtonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MeditateScreen();
                        },
                      ),
                    );
                  },
                  child: Text('▷ Play Next Session',
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 40, right: 40),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TrackCard(
                  img: 'assets/images/img_top_list.png',
                  title: 'Sweet Memories',
                  date: 'December 29 Pre-Launch',
                  icon: 'assets/images/icon_list.png'),
              TrackCard(
                  img: 'assets/images/img_middle_list.png',
                  title: 'A Day Dream',
                  date: 'December 29 Pre-Launch',
                  icon: 'assets/images/icon_list.png'),
              TrackCard(
                  img: 'assets/images/img_bottom_list.png',
                  title: 'Mind Explore',
                  date: 'December 29 Pre-Launch',
                  icon: 'assets/images/icon_list.png')
            ],
          ),
        )
      ],
    );
  }
}
