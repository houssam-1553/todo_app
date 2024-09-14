import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskController extends GetxController {
  var tasks = <Map<String, dynamic>>[].obs;


  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksData = prefs.getStringList('tasks') ?? [];
    tasks.value = tasksData.map((task) => jsonDecode(task) as Map<String, dynamic>).toList();
  }

  void addTask(Map<String, dynamic> newTask) {
    tasks.add(newTask);
    saveTasks();
  }

  void toggleTaskCompletion(int index) {
    if (index < 0 || index >= tasks.length) return; // Check for index validity

    // Debug: Print current task and completion status
    print('Before toggle: ${tasks[index]}');

    bool currentCompletionStatus = tasks[index]['completed'] ?? false;
    tasks[index]['completed'] = !currentCompletionStatus;

    // Debug: Print updated task and completion status
    print('After toggle: ${tasks[index]}');

    saveTasks();
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksData = tasks.map((task) => jsonEncode(task)).toList();
    await prefs.setStringList('tasks', tasksData);
  }

  void resetTasks() {
    tasks.clear();
    saveTasks();
  }

  double get progress {
    final completedTasks = tasks.where((task) => task['completed'] == true).length;
    return tasks.isEmpty ? 0 : completedTasks / tasks.length;
  }
}
