import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config/services/notificationService.dart';
import 'package:todo_app/screens/Home/provider.dart';

class AddTaskController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController reminderController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();


  

  // Method to pick reminder time
  Future<void> pickReminder(BuildContext context) async {
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(context).requestFocus(FocusNode());

    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null) {
      reminderController.text = picked.format(context); // Save selected time
    } else {
      reminderController.text = time.format(context); // Default to current time
    }
  }

  // Save task method
  void saveTask(BuildContext context) async {
  final title = titleController.text.trim();
  final description = descriptionController.text.trim();
  final reminderDate = dateController.text.trim(); // The selected date as String
  final reminderTime = timeController.text.trim(); // The selected time as String

  // Validate fields
  if (title.isEmpty || description.isEmpty || reminderDate.isEmpty || reminderTime.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All fields are required'), backgroundColor: Colors.redAccent),
    );
    return;
  }

  // Convert the reminder date and time to DateTime
  DateTime reminderDateTime = _combineDateAndTime(reminderDate, reminderTime);

  // Ensure the reminder is not in the past
  if (reminderDateTime.isBefore(DateTime.now())) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reminder cannot be in the past'), backgroundColor: Colors.redAccent),
    );
    return;
  }

  // Save task and schedule notification
  final newTask = Task(
    title: title,
    description: description,
    reminderTime: reminderDateTime.toString(),
  );

  final taskProvider = Provider.of<TaskProvider>(context, listen: false);
  taskProvider.addTask(newTask);

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    tasks.add(jsonEncode(newTask.toMap()));
    await prefs.setStringList('tasks', tasks);

    NotificationService().scheduleNotification(
      1,  // Unique notification ID
      title,
      description,
      reminderDateTime,  // Pass the correct DateTime for scheduling
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task Added Successfully'), backgroundColor: Colors.green),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to add task'), backgroundColor: Colors.redAccent),
    );
  }
}

// Helper function to combine date and time
DateTime _combineDateAndTime(String date, String time) {
  DateTime parsedDate = DateTime.parse(date); // Parse the date
  TimeOfDay parsedTime = _parseTimeOfDay(time); // Parse the time

  return DateTime(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    parsedTime.hour,
    parsedTime.minute,
  );
}

// Helper function to parse TimeOfDay from string
TimeOfDay _parseTimeOfDay(String time) {
  final format = time.contains('AM') || time.contains('PM') ? 'hh:mm a' : 'HH:mm'; // Handle 12-hour/24-hour format
  DateTime timeParsed = DateFormat(format).parse(time);
  return TimeOfDay.fromDateTime(timeParsed);
}

}
