import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskcount {
    return _tasks.length;
  }

  void addtask(String tasktitle) {
    final task = Task(name: tasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updatetask(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deletetask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
