// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_school_journal2/db/todos_database.dart';
import 'package:home_school_journal2/util/my_bottom_app_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Pomodoro extends StatefulWidget {

  const Pomodoro({
    Key? key,
  }) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {

  double percent = 0;
  static int timeInMinute = 25;

  Timer? timer;

  Map? data;
  int? taskId;
  dynamic task;
  bool isTimerOn = false;

  _startTimer() {
    int tTime = timeInMinute * 60;
    double secPercent = tTime / 100;
    // setState(() {
    //   isTimerOn = true;
    // });
    timer = Timer.periodic(Duration(seconds: 1), (timer) { 
      if (isTimerOn) {
        timer.cancel();
        setState(() {
          isTimerOn = false;
        });
        return ;
      }
      setState(() {
        if (tTime>0) {
          tTime--;
          if (tTime % 60 == 0) {
            timeInMinute--;
          }
          if (tTime %secPercent == 0) {
            if (percent<1) {
              percent += 0.01;
            }
            else {
              percent = 1;
            }
          }
        }
        else {
          percent = 0;
          if (taskId == null) {
            timeInMinute = 25;
          }
          else {
            timeInMinute = task.pomodoroTime;
          }
          isTimerOn = false;
          timer.cancel();
        } 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments ?? <dynamic, dynamic>{}) as Map;
    taskId = data?['taskId'];
    
    // if (taskId != null) {
    //   task = TodoDatabaseHelper.instance.getTodo(taskId);
    // }

    // setState(() {
    //   if (task != null) {
    //     timeInMinute = task.pomodoroTime;
    //   } else {
    //     timeInMinute = 25;
    //   }
    // });

    return Scaffold(
      backgroundColor: Color(0XFFEBF5FB),
      // app bar
      appBar: AppBar(
        backgroundColor: Color(0XFFEBF5FB),
        iconTheme: IconThemeData(
          color: Color(0XFF273746), //change your color here
        ),
        elevation: 0,
        title: Text(
          'Pomodoro'
        ),
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0XFF273746),
          fontSize: 26,
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
      // body columns
      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: CircularPercentIndicator(
              radius: 120,
              circularStrokeCap: CircularStrokeCap.round,
              lineWidth: 12,
              progressColor: Colors.blue.shade300,
              animation: true,
              percent: percent,
              animateFromLastPercent: true,
              center: Text(
                '$timeInMinute',
                style: TextStyle(
                  color: Colors.blue.shade300,
                  fontSize: 60,
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(
            // decoration: BoxDecoration(color: Colors.amber),
            margin: EdgeInsets.fromLTRB(46, 5, 46, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                height: 72,
                width: 120,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'STUDY\n25 min',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 72,
                width: 120,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'BREAK\n5 min',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ]
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: _startTimer,
            child: Text(
              isTimerOn? 'pause':'start studying',
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            color: Colors.yellow,
            height: 160,
            child: Text(
              'What is pomodoro technique? \nPomodoro Technique is a time management system that encourages people to work with the time they have—rather than against it. Using this method, you break your workday into 25-minute chunks separated by five-minute breaks. These intervals are referred to as pomodoros. After about four pomodoros, you take a longer break of about 15 to 20 minutes.',
            ),
          ),
        ],
      ),
    );
  }
}