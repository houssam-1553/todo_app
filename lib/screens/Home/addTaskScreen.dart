import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/config/services/notificationService.dart';
import 'package:todo_app/screens/Home/addTaskController.dart'; // Assuming you have this file

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final AddTaskController controller = Get.put(AddTaskController()); // GetX controller

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Add New Task", style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06),
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              TextField(
                controller: controller.descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Task Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),

              // Date Picker for Reminder
              TextField(
                controller: controller.dateController,  // Date controller
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  );
                  if (pickedDate != null) {
                    controller.dateController.text = pickedDate.toString().substring(0, 10); // Format date
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Reminder Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),

              SizedBox(height: height * 0.06),

              // Time Picker for Reminder
              TextField(
                controller: controller.timeController,  // Time controller
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    controller.timeController.text = pickedTime.format(context); // Format time
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Reminder Time',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),

              SizedBox(height: height * 0.06),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Call saveTask to handle task saving
                    controller.saveTask(context); 

                    // Parse the reminder date and time
                    DateTime? reminderDate = DateTime.tryParse(controller.dateController.text);
                    TimeOfDay? reminderTime = TimeOfDay.now();

                    if (reminderDate != null && controller.timeController.text.isNotEmpty) {
                      final timeParts = controller.timeController.text.split(':');
                      final hour = int.parse(timeParts[0]);
                      final minute = int.parse(timeParts[1].split(' ')[0]);
                      final isPM = controller.timeController.text.contains('PM');
                      
                      // Convert TimeOfDay to 24-hour format
                      int finalHour = isPM && hour != 12 ? hour + 12 : hour;
                      reminderDate = DateTime(
                        reminderDate.year,
                        reminderDate.month,
                        reminderDate.day,
                        finalHour,
                        minute,
                      );

                      print('Reminder DateTime: $reminderDate');

                      // Show notification with the task details
                      NotificationService().scheduleNotification(
                        1,  // Unique ID for notification
                        controller.titleController.text,  // Task title
                        controller.descriptionController.text,  // Task description
                        reminderDate // Reminder DateTime
                      );
                    } else {
                      print("Invalid date or time");
                    }
                  },
                  child: const Text('Save Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
