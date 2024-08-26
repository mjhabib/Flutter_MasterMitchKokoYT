import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/todo_database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  // get data from DB
  @override
  void initState() {
    super.initState();

    if (_myBox.get('todoList') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void onChanged(int index) {
    setState(() {
      db.todoItems[index][1] = !db.todoItems[index][1];
    });
    db.updateData();
  }

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      db.todoItems.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoItems.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoItems.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoItems[index][0],
            isChecked: db.todoItems[index][1],
            onChanged: (_) => onChanged(index),
            deleteTask: (_) => deleteTask(index),
          );
        },
      ),
    );
  }
}
