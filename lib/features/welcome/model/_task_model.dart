import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  List<Map<String, dynamic>> _tasksList = [];

  List<Map<String, dynamic>> get getTasksList => _tasksList;

  void addTasks(Map<String, dynamic> value) {
    _tasksList.add(value);
    notifyListeners();
  }

  void removeTasks(String taskName) {
    _tasksList.removeWhere((task) => task['task'] == taskName);
    notifyListeners();
  }
}
