// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddTodoForm extends StatefulWidget {
  final String title;
  final String description;
  final String completionTime;
  final String pomodoroTime;
  const AddTodoForm({
    Key? key,
    required this.title,
    required this.description,
    required this.completionTime,
    required this.pomodoroTime,
  }) : super(key: key);

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.fromLTRB(40, 34, 40, 38),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(34),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
              child: Column(
              children: [
                TextField(
                  onChanged: (text) {
                  },
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFF273746),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.note_alt),
                    hintText: 'Task title',
                  ),
                ),
                TextField(
                  onChanged: (text) {
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    hintText: 'Task description',
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    // setState(() {
                    //   completionTime = text;
                    // });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.timer),
                    hintText: 'Approx completion time (minutes)',
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    // setState(() {
                    //   pomodoroTime = text;
                    // });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // prefixIcon: Image.asset(
                    //   'lib/assets/pomodoro-technique.png',
                    //   width: 5,
                    // ),
                    prefixIcon: Icon(Icons.timer),
                    hintText: 'Pomodoro time (minutes)',
                  ),
                ),
              ],
            ),
          );
  }
}