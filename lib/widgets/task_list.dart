import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:fekrni/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              taskPrice: task.price.toString(),
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {taskData.deleteTask(task,);},
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String taskPrice;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile({
    this.isChecked,
    this.taskTitle,
    this.checkboxCallback,
    this.longPressCallback,
    this.taskPrice,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        taskPrice,
      ),
      trailing: Checkbox(
        activeColor: Colors.orange,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
