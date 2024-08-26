import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoItems = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  // run only once (after installing the app)
  void createInitialData() {
    todoItems = [
      ['Welcome to your todo app', false],
      ['Slide to the left to delete these tasks', false],
    ];
  }

  // read data from DB
  void loadData() {
    todoItems = _myBox.get('todoList');
  }

  // update the DB
  void updateData() {
    _myBox.put('todoList', todoItems);
  }
}
