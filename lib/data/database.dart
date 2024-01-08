import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList =[];

  // referencing our box
  final mybox = Hive.box('testBox');

  // load this when the app is launched for the first time
  void createInitialData(){
    todoList = [
    ['Buy Bread', false],
    ['Buy Milk', false],
  ];
  }

  // loading the data
  void loadData(){
    todoList = mybox.get('TODOLIST');
  }

  // update the database
  void updateDatabase(){
    mybox.put('TODOLIST', todoList);
  }
}