// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'
        ),
      ),
      body: Center(
        child: Text(
          'No settings available',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}