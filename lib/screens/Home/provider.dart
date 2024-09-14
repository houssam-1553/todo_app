import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  String title;
  String description;
  bool completed;

  Task({
    required this.title,
    required this.description,
    this.completed = false, required String reminderTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      reminderTime: map['date'],
      completed: map['completed'],
    );
  }
}

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> tasksData = prefs.getStringList('tasks') ?? [];
      _tasks = tasksData.map((taskData) => Task.fromMap(jsonDecode(taskData))).toList();
      print("Task Loaded Successfully");
      notifyListeners();
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
    _saveTasks();
  }

  void toggleTaskCompletion(int index) {
    if (index < 0 || index >= _tasks.length) return;
    _tasks[index].completed = !_tasks[index].completed;
    notifyListeners();
    _saveTasks();
  }
  void removeTask(int index) {
   
    _tasks.removeAt(index);
    notifyListeners();
    _saveTasks();
  }

  void resetTasks() {
    _tasks.clear();
    notifyListeners();
    _saveTasks();
  }

  Future<void> _saveTasks() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> tasksData = _tasks.map((task) => jsonEncode(task.toMap())).toList();
      await prefs.setStringList('tasks', tasksData);
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }

  double get progress {
    final completedTasks = _tasks.where((task) => task.completed).length;
    return _tasks.isEmpty ? 0 : completedTasks / _tasks.length;
  }
}
