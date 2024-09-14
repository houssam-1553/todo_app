import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/services/notificationService.dart';
import 'package:todo_app/config/theme/app_theme.dart';
import 'package:todo_app/screens/Home/homeScreen.dart';
import 'package:todo_app/screens/Home/provider.dart';
import 'package:todo_app/screens/onbrd/onboarding.dart';
import 'package:todo_app/spalsh.dart';

void main() {
  NotificationService().initialize();
  NotificationService().initNotification();
  runApp( 
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MainApp())
      );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.light,
      home: const OnboardingScreen()
        
      
    );
  }
}
