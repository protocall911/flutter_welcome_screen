import 'package:flutter/material.dart';
import 'package:welcome_screen/MeditateScreen/components/body.dart';
import 'package:welcome_screen/main.dart';

class MeditateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: -30,
          title: Text(
            'Meditate',
            style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            child: Container(
              color: kAppBarBottomLineColor,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only( right: 20),
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black),
            ),
          ],
        ),
        body: Body());
  }
}