import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TaskTile(
              task.name,
              task.isdone,
              (bool? checkboxstate) {
                taskdata.updatetask(task);
              },
              () {
                taskdata.deletetask(task);
              },
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}
