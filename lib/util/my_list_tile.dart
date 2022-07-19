// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.iconImage,
    required this.tileTitle,
    required this.tileContent,
  }) : super(key: key);

  final String iconImage;
  final String tileTitle;
  final String tileContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 2, 8, 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                // height: 80,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.shade400,
                  //     blurRadius: 20,
                  //     spreadRadius: 2,
                  //   ),
                  // ],
                ),
                child: Center(
                  child: Image.asset(iconImage, height: 60,),
                ),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tileTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 18,          
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    width: 200,
                    child: Text(
                      tileContent,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,                 
                      ),
                    ),
                  ),
                ],
              ),                
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}