import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/Home/provider.dart';
import 'package:todo_app/screens/onbrd/onboarding.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'addTaskScreen.dart'; // Import your AddTaskScreen

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     final now = DateTime.now();
 String date = DateFormat.yMMMMd('en_US').format(now);
 bool dark = isdark(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, size: 30),
        ),
        title: Text(
          "Daily Tasks",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false).resetTasks();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All tasks have been cleared'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            icon: const Icon(Icons.restore_from_trash, size: 30),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: width * 0.2,
                  height: width * 0.2,
                  child: Consumer<TaskProvider>(
                    builder: (context, taskProvider, child) {
                      return CircularProgressIndicator(
                        value: taskProvider.progress,
                        strokeWidth: 12,
                      );
                    },
                  ),
                ),
                SizedBox(width: width * 0.1),
                Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) {
                    final progress = (taskProvider.progress * 100).toInt();
                    final bool isFinished = taskProvider.progress == 1;
                    return Text(
                      "it's $date \nyou have reached $progress% of \nyour Today's Goals \n${isFinished ? "Congrats!" : ""}",
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                  
                ),

                         
              ],
            ),
            SizedBox(height: height * 0.03),
            const Divider(thickness: 2, color: Color.fromARGB(255, 200, 195, 195)),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  return ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskProvider.tasks[index];
                      return Dismissible(
                        key: Key(task.title + index.toString()),

                        onDismissed: (direction) {
    taskProvider.removeTask(index);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
     ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Task dismissed')));
    
    // You can add additional logic based on the direction if needed
  },
                        child: Card(
                          elevation: 7,
                          shadowColor: task.completed ?
                          dark ?  Colors.green[500]  :Colors.green[200] : null,
                          
                          color: task.completed ?
                          dark ?  Colors.green[500]  :Colors.green[200] : null,
                          shape: RoundedRectangleBorder(

borderRadius: BorderRadius.circular(18.0),

),
                       
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              title: Text(
                                task.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              subtitle: Text(
                                task.description,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  task.completed ? Icons.check_circle : Icons.circle_outlined,
                                  color: task.completed ? Colors.white : null,
                                ),
                                onPressed: () => taskProvider.toggleTaskCompletion(index),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddTaskScreen()),
        ),
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        child: const Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
