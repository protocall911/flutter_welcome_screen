import 'package:flutter/material.dart';
import 'package:welcome_screen/MeditateScreen/components/main_playlist_card.dart';
import 'package:welcome_screen/MeditateScreen/components/playlist_card.dart';
import 'package:welcome_screen/MeditateScreen/components/tag_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TagList(),
        SizedBox(height: 20),
        MainPlaylistCard(),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: PlaylistCard(
                    img: 'assets/images/img_orange_birds.png',
                    title: 'The Sleep Hour',
                    author: 'Ashna Mukherjee',
                    time: '3 Sessions'),
              ),
              Expanded(
                child: PlaylistCard(
                    img: 'assets/images/img_yellow_lune.png',
                    title: 'Easy on the Mission',
                    author: 'Peter Mach',
                    time: '5 minutes'),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: PlaylistCard(
                    img: 'assets/images/img_blue_planet.png',
                    title: 'Relax with Me',
                    author: 'Amanda James',
                    time: '3 Sessions'),
              ),
              Expanded(
                child: PlaylistCard(
                    img: 'assets/images/img_green_birds.png',
                    title: 'Sun and Energy',
                    author: 'Micheal Hiu',
                    time: '5 minutes'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


