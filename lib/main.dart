// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:home_school_journal2/pages/home_page.dart';
import 'package:home_school_journal2/pages/pomodoro_page.dart';
import 'package:home_school_journal2/pages/settings_page.dart';
import 'package:home_school_journal2/pages/todo_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHome(),
        '/pomodoro': (context) => const Pomodoro(),
        '/todos':(context) => const MyTodos(),
        '/settings':(context) => const MySettings(),
      },
    );
  }
}
