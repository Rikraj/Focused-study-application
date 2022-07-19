// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:home_school_journal2/util/card_image.dart';
import 'package:home_school_journal2/util/my_button.dart';
import 'package:home_school_journal2/util/my_list_tile.dart';
import 'package:home_school_journal2/util/my_bottom_app_bar.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEBF5FB),
      // app bar
      appBar: AppBar(
        backgroundColor: Color(0XFFEBF5FB),
        elevation: 0,
        title: Text(
          'My Journal'
        ),
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0XFF273746),
          fontSize: 26,
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
      body: Column(
        children: [
          // image
          SizedBox(height: 20,),
          MyCardImage(),

          // 3 buttons : + settings (toggle dark-light mode)
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // attendance button
              MyButton(
                iconPath: 'lib/assets/technique.png', 
                buttonText: 'Pomodoro',
                pagePath: '/pomodoro',
              ),
              MyButton(
                iconPath: 'lib/assets/to-do-list.png', 
                buttonText: 'Tasks',
                pagePath: '/todos',
              ),
              MyButton(
                iconPath: 'lib/assets/settings.png', 
                buttonText: 'Settings',
                pagePath: '/settings',
              ),
            ],
          ),

          // column : statistics + notes
          SizedBox(height: 25,),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                MyListTile(
                  iconImage: 'lib/assets/analytics.png', 
                  tileTitle: 'Statistics', 
                  tileContent: 'Tasks and completions',
                ),
                SizedBox(height: 8),
                MyListTile(
                  iconImage: 'lib/assets/notes.png', 
                  tileTitle: 'Notes', 
                  tileContent: 'Quick notes for revision',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}