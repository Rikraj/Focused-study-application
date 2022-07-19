// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  
  final String iconPath;
  final String buttonText;
  final String pagePath;

  const MyButton({
    Key? key,
    required this.iconPath,
    required this.buttonText,
    required this.pagePath,
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            try {
              Navigator.pushNamed(context, pagePath);
            }
            catch(e) {
              print('No such page exists');
            }
          },
          child: Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(18),
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
              child: Image.asset(iconPath),
            ),
          ),
        ),
        SizedBox(height: 8,),
        Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}