import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:goalsync/screens/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/task_controller.dart';
import 'controller/theme_controller.dart';
import 'screens/welcome_screen.dart';
import 'screens/habit_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(TaskController()); // Initialize TaskController

  final prefs = await SharedPreferences.getInstance();
  final hasAddedHabit = prefs.getBool('hasAddedHabit') ?? false;

  runApp(MyApp(hasAddedHabit: hasAddedHabit));
}

class MyApp extends StatelessWidget {
  final bool hasAddedHabit;

  MyApp({required this.hasAddedHabit});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
      home: hasAddedHabit ? HabitScreen() : WelcomeScreen(),
    );
  }
}
