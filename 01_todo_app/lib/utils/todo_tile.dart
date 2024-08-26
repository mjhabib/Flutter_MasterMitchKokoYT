import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.taskName,
      required this.isChecked,
      required this.onChanged});

  final String taskName;
  final bool isChecked;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Checkbox(
              activeColor: Colors.black,
              value: isChecked,
              onChanged: onChanged,
            ),
            Text(
              taskName,
              style: TextStyle(
                  fontSize: 16,
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
          ],
        ),
      ),
    );
  }
}
