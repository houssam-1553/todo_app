import 'package:flutter/material.dart';
import 'package:todo_app/config/color_manager.dart';


class AppTheme {
  AppTheme._(); 

  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 101, 81, 193),
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      primaryContainer: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    textTheme: Htexttheme.lightText,
    progressIndicatorTheme: const ProgressIndicatorThemeData(circularTrackColor: Color.fromARGB(255, 201, 186, 225)),
    cardTheme: const CardTheme(
      color: Color.fromARGB(255, 201, 186, 225),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white), 
         textStyle: WidgetStateProperty.all(Htexttheme.lightButtonText.titleMedium),// Button text color in light theme
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.black), // Border color for outlined button
        ),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black), // Text color for outlined button
      ),
    ),
  );

  static ThemeData darktheme = ThemeData(
   useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      shadow: Colors.white,
      primary: Color.fromARGB(255, 101, 81, 193),
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
    //  primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Color.fromARGB(255, 14, 16, 18),  
      onSurface: Colors.white,
    ),
    textTheme: Htexttheme.darkText,
    elevatedButtonTheme: ElevatedButtonThemeData(
      
      style: ButtonStyle(
        

        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
         textStyle: WidgetStateProperty.all(Htexttheme.darkButtonText.titleMedium),// Button text color in dark theme
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(circularTrackColor: Color.fromARGB(255, 201, 186, 225)),
 cardTheme: const CardTheme(
      color: Color.fromARGB(255, 101, 81, 193),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.white), // Border color for outlined button
        ),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // Text color for outlined button
      ),
    ),
  );
}



class Htexttheme {
  static const TextTheme lightText = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.black),
    headlineLarge: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.normal, color: Colors.black),
    titleLarge: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.black),
    titleMedium: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.black),
    titleSmall: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.black),
    bodyLarge: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.black),
    bodyMedium: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.black),
    bodySmall: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.black),
    labelLarge: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.black),
    labelSmall: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.black),
  );

  static const TextTheme darkText = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.white),
    displaySmall: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.white),
    headlineLarge: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.normal, color: Colors.white),
    titleLarge: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.white),
    titleMedium: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.white),
    titleSmall: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.white),
    bodyLarge: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.white),
    bodyMedium: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.white),
    bodySmall: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.white),
    labelLarge: TextStyle(fontFamily: 'Nunito Normal', fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.white),
    labelSmall: TextStyle(fontFamily: 'Nunito Light', fontWeight: FontWeight.w300, color: Colors.white),
  );

  static const TextTheme lightButtonText = TextTheme(
    titleMedium: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.white),
  );

  static const TextTheme darkButtonText = TextTheme(
    titleMedium: TextStyle(fontFamily: 'Nunito Bold', fontWeight: FontWeight.bold, color: Colors.black),
  );
}
