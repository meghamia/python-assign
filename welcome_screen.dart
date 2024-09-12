import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/task_controller.dart';
import 'habit_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final TaskController taskCtrl = Get.put(TaskController()); // TaskController for managing tasks
  final TextEditingController textCtrl = TextEditingController(); // TextEditingController for input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  elevation: 15,
                ),
                onPressed: () {
                  _showAddHabitBottomSheet(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Habit',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddHabitBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to adjust for the keyboard
      builder: (context) {
        // Using MediaQuery to detect the keyboard height and adjust bottom padding
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: keyboardHeight), // Move bottom sheet up with keyboard
          child: Material(
            elevation: 16, // Elevation for the bottom sheet
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 350, // Fixed height for the bottom sheet
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Center(
                    child: Text(
                      'Add Habit',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40), // Space between heading and input field

                  // TextFormField with shadow
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 10), // Shadow position
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: textCtrl,
                      decoration: InputDecoration(
                        labelText: 'Enter Habit',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 60), // Space between input field and button

                  // Add Button with increased width and shadow
                  Center(
                    child: SizedBox(
                      width: 140, // Increased width for button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          elevation: 30,
                        ),
                        onPressed: () {
                          _addTask(context);
                        },
                        child: Text('Add', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _addTask(BuildContext context) async {
    final taskName = textCtrl.text.trim();
    if (taskName.isNotEmpty) {
      // Add task to the database
      await taskCtrl.addTask(taskName);

      // Clear the text field
      textCtrl.clear();

      // Close the bottom sheet
      Navigator.pop(context);

      // Mark that the habit has been added
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasAddedHabit', true);

      // Navigate to HabitScreen
      Get.to(HabitScreen(), transition: Transition.fadeIn);
    }
  }
}
