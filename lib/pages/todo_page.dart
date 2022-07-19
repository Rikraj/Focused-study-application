// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:home_school_journal2/db/todos_database.dart';
import 'package:home_school_journal2/util/my_bottom_app_bar.dart';
import 'dart:ui' as ui;

class MyTodos extends StatefulWidget {
  const MyTodos({Key? key}) : super(key: key);

  @override
  State<MyTodos> createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
  String taskTitle = '';
  String taskDescription = '';
  String taskCompletionTime = '';
  String taskPomodoroTime = '';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _completionController = TextEditingController();
  final TextEditingController _pomodoroController = TextEditingController();

  int? selectedId;

  @override
  Widget build(BuildContext context) {
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
          'My Tasks'
        ),
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0XFF273746),
          fontSize: 26,
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Image.asset(
          'lib/assets/add.png',
          height: 36,
        ),
        onPressed: () {
          if (taskTitle != '' && taskCompletionTime!='' && taskPomodoroTime!='') {
            try {
              int tempCompletionTime = double.parse(taskCompletionTime).floor();
              int tempPomodoroTime = double.parse(taskPomodoroTime).floor();

              TodoDatabaseHelper.instance.add(
                TodoTask(
                  title: taskTitle, 
                  description: taskDescription,
                  completionTime: tempCompletionTime , 
                  pomodoroTime: tempPomodoroTime,
                )
              );
              _titleController.clear();
              _descriptionController.clear();
              _completionController.clear();
              _pomodoroController.clear();
            }
            catch(e) {
              // print('enter valid time value');
            }
            
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
      
            // to do form
            // AddTodoForm(
            //   title: taskTitle, 
            //   description: taskDescription, 
            //   completionTime: taskCompletionTime, 
            //   pomodoroTime: taskPomodoroTime,
            // ),
            Container(
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
                    controller: _titleController,
                    onChanged: (text) {
                      setState(() {                     
                        taskTitle = text;
                      });
                      // print(taskTitle);
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
                    controller: _descriptionController,
                    onChanged: (text) {
                      setState(() {                     
                        taskDescription = text;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      hintText: 'Task description',
                    ),
                  ),
                  TextField(
                    controller: _completionController,
                    onChanged: (text) {
                      setState(() {
                        taskCompletionTime = text;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      hintText: 'Approx completion time (minutes)',
                    ),
                  ),
                  TextField(
                    controller: _pomodoroController,
                    onChanged: (text) {
                      setState(() {
                        taskPomodoroTime = text;
                      });
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<TodoTask>>(
                future: TodoDatabaseHelper.instance.getTodos(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<TodoTask>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                          color: Color(0XFF273746),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    );
                  }
                  return snapshot.data!.isEmpty
                      ? Center(
                          child: Text(
                            'No tasks to show.',
                            style: TextStyle(
                              color: Color(0XFF273746),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        )
                      : ListView(
                          // padding wrt the screen, same as margin for container
                          padding: EdgeInsets.fromLTRB(30, 25, 30, 25),
                          children: snapshot.data!.map((todo) {
                            // return Center(
                            //   child: Card(
                            //     color: selectedId == grocery.id
                            //         ? Colors.white70
                            //         : Colors.white,
                            //     child: ListTile(
                            //       title: Expanded(
                                    
                            //         child: Text(
                            //           maxLines: 2,
                            //           overflow: TextOverflow.ellipsis,
                            //           '${grocery.title} ${grocery.completionTime} ${grocery.id} ${grocery.completedTime}',
                            //         ),
                            //       ),
                            //       onTap: () {
                            //         setState(() {
                            //           if (selectedId == null) {
                            //             taskTitle = grocery.title;
                            //             selectedId = grocery.id;
                            //           } else {
                            //             taskTitle = '';
                            //             selectedId = null;
                            //           }
                            //         });
                            //       },
                            //       onLongPress: () {
                            //         setState(() {
                            //           TodoDatabaseHelper.instance.remove(grocery.id!);
                            //         });
                            //       },
                            //     ),
                            //   ),
                            // );

                            return Container(
                              // padding inside container
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              // gap between containers
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: selectedId==todo.id ? Colors.grey.shade300:Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            TodoDatabaseHelper.instance.remove(todo.id!);
                                          });
                                        },
                                        child: Container(
                                          // height: 80,
                                          // margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          padding: EdgeInsets.symmetric(horizontal: 18, vertical:18),
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
                                          child: 
                                          // adding gradient to icon
                                          // ShaderMask(
                                          //   blendMode: BlendMode.srcIn,
                                          //   shaderCallback: (Rect bounds) {
                                          //     return ui.Gradient.linear(
                                          //       Offset(2.0, 24.0),
                                          //       Offset(20.0, 2.0),
                                          //       [
                                          //         Colors.yellowAccent.shade700,
                                          //         Colors.green.shade400,
                                          //       ],
                                          //     );
                                          //   },
                                          //   child: Icon(
                                          //     Icons.delete,
                                          //     size: 30,
                                          //     // color: Colors.yellowAccent.shade400,
                                          //   ),
                                          // ),
                                          Image.asset(
                                            'lib/assets/work-in-progress.png',
                                            height: 32,
                                          ),
                                          
                                        ),
                                      ),
                                      SizedBox(width: 14),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (selectedId == null) {
                                              // taskTitle = todo.title;
                                              selectedId = todo.id;
                                            }
                                            else {
                                              selectedId = null;
                                            }
                                          });
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 220,
                                              child: Text(
                                                todo.title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold, 
                                                  fontSize: 18,          
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8,),
                                            SizedBox(
                                              width: 220,
                                              child: Text(
                                                'Total time: ${todo.completionTime} min\nCompleted time: ${todo.completedTime ?? '0 '} min',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14, 
                                                  letterSpacing: 1.4,                
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),                
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedId = todo.id;
                                      });
                                      Navigator.pushNamed(context, '/pomodoro', arguments: {'taskId': selectedId});
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                  ),
                                ],
                              ),
                            );



                          }).toList(),
                        );
                }),
          ),
          ]
        ),
      ),
    );
  }
}