/* 
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
// ignore: depend_on_referenced_packages





class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService
  void initialize() {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
   
    
    // Initialize your notification plugin
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // Initialize timezone (required for scheduling)/*  */
     tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = const InitializationSettings(
      android: initializationSettingsAndroid,
    );

    //await flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (NotificationResponse notificationResponse)async{});
  }

  Future<void> showNotification(int id, String title, String body) async {
   await  flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
   ),onDidReceiveNotificationResponse: (NotificationResponse notificationResponse)async{});
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your_channel_id', 'your_channel_name',
      icon: '@mipmap/ic_launcher',
      importance: Importance.max,
     priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
    print("done");
  }

  Future<void> scheduleNotification(int id, String title, String body, DateTime scheduledTime) async {
   await flutterLocalNotificationsPlugin.zonedSchedule(
  id,
  title,
  body,
   tz.TZDateTime.from(scheduledTime, tz.local),  // Ensure scheduledTime is a valid DateTime object
  const NotificationDetails(
    android: AndroidNotificationDetails(
      'your_channel_id', 'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    ),
  ),
  androidAllowWhileIdle: true,
  uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  matchDateTimeComponents: DateTimeComponents.time,  // Match daily reminder


   );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
 */