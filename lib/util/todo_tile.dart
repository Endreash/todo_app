import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const TodoTile(this.taskName, this.taskCompleted, this.onChanged, this.deleteFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25, 
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: (context) => deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ]),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Row(children: [
            Checkbox(
              activeColor: Colors.black, 
              value: taskCompleted, 
              onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
              ),
          ]),
        ),
      ),
    );
  }
}