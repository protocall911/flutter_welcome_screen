import 'package:flutter/material.dart';
import 'package:welcome_screen/main.dart';

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final tagsList = <String>[
    'All',
    'Bible In a Year',
    'Dailies',
    'Minutes',
    'November'
  ];
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      height: 58,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selected == index
                        ? kPrimaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  child: Text(
                    tagsList[index],
                    style: TextStyle(
                      color: selected == index ? Colors.white : kPrimaryColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 15,
              ),
          itemCount: tagsList.length),
    );
  }
}
