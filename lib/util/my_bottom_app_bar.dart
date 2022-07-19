// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                child: SizedBox(
                  height: 40,
                  child: Image.asset('lib/assets/home.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/pomodoro');
                },
                child: SizedBox(
                  height: 40,
                  child: Image.asset('lib/assets/in-time.png'),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  child: Image.asset('lib/assets/list.png'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}