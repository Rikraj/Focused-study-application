// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoTask {
  final int? id;
  final String title;
  final String description;
  final int completionTime;
  final int pomodoroTime;
  final int? completedTime;
  final int? isCompleted;

  TodoTask({
    this.id, 
    required this.title,
    required this.description,
    required this.completionTime,
    required this.pomodoroTime,
    this.completedTime,
    this.isCompleted
  });

  factory TodoTask.fromMap(Map<String, dynamic> json) => TodoTask(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        completionTime: json['completionTime'],
        pomodoroTime: json['pomodoroTime'],
        completedTime: json['completedTime'],
        isCompleted: json['isCompleted']
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completionTime': completionTime,
      'pomodoroTime': pomodoroTime,
      'completedTime': completedTime,
      'isCompleted': isCompleted,
    };
  }
}

class TodoDatabaseHelper {
  TodoDatabaseHelper._privateConstructor();
  static final TodoDatabaseHelper instance = TodoDatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'todos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos(
          id INTEGER PRIMARY KEY,
          title TEXT,
          description TEXT,
          completionTime INTEGER,
          pomodoroTime INTEGER,
          completedTime INTEGER,
          isCompleted INTEGER
      )
      ''');
  }

  Future<List<TodoTask>> getTodos() async {
    Database db = await instance.database;
    var todos = await db.query('todos', orderBy: 'title');
    List<TodoTask> todoTaskList = todos.isNotEmpty
        ? todos.map((c) => TodoTask.fromMap(c)).toList()
        : [];
    return todoTaskList;
  }

  // Future getTodo(int? id) async {
  //   Database db = await instance.database;
  //   var todos = await db.query('todos', orderBy: 'title');
    
  // }

  Future<int> add(TodoTask todoTask) async {
    Database db = await instance.database;
    return await db.insert('todos', todoTask.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(TodoTask todoTask) async {
    Database db = await instance.database;
    return await db.update('todos', todoTask.toMap(),
        where: "id = ?", whereArgs: [todoTask.id]);
  }
}