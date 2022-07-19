// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyCardImage extends StatelessWidget {
  const MyCardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height - kBottomNavigationBarHeight)*0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/study-image (2).jpg'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          );
  }
}