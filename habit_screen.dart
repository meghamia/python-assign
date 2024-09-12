// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:goalsync/controller/task_controller.dart';
// import 'package:goalsync/screens/task_screen.dart';
//
// class HabitScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TaskController taskController = Get.find();
//
//
//     return Scaffold(
//       appBar: _appBar(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(17.0),
//             child: Row(
//               children: [],
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (taskController.isTaskSelected.length <
//                   taskController.taskList.length) {
//                 taskController.isTaskSelected.addAll(List.generate(
//                   taskController.taskList.length -
//                       taskController.isTaskSelected.length,
//                       (_) => false,
//                 ));
//               }
//
//               return ListView.builder(
//                 itemCount: taskController.taskList.length,
//                 itemBuilder: (context, index) {
//                   return Dismissible(
//                     key: ValueKey(taskController.taskList[index]),
//                     background: Container(
//                       color: Colors.blue.shade300,
//                       child: Icon(
//                         Icons.delete_outline,size: 35,
//                       ),
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                     ),
//                     direction: DismissDirection.endToStart,
//                     onDismissed: (direction){
//                       taskController.deleteTask(index);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(TaskScreen(taskName:taskController.taskList[index],));
//                           //_openBottomSheet(context, taskController, index);
//                         },
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 5.0),
//                           padding: EdgeInsets.all(6.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(
//                               color: Colors.black54,
//                               width: 2,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   taskController.taskList[index],
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                               Checkbox(
//                                 value: taskController.isTaskSelected[index],
//                                 onChanged: (bool? value) {
//                                   if (value != null) {
//                                     taskController.toggleTaskSelection(
//                                         index, value);
//                                   }
//                                 },
//                                 activeColor:
//                                 Colors.blue, // Checkbox color when selected
//                                 checkColor: Colors.white, // Color of the checkmark
//                               ),
//
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//   _appBar() {
//     return AppBar(
//       title: Text("Habit Screen"),
//       backgroundColor: Colors.blue,
//       actions: [
//         TextButton(
//           onPressed: () {
//             _showAddTaskDialog();
//           },
//           child: Text(
//             'Add Task',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _showAddTaskDialog() {
//     final TaskController taskController = Get.find();
//     final TextEditingController taskControllerInput = TextEditingController();
//
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add New Task'),
//           content: TextField(
//             controller: taskControllerInput,
//             decoration: InputDecoration(hintText: 'Enter task'),
//             autofocus: true,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 final task = taskControllerInput.text.trim();
//                 if (task.isNotEmpty) {
//
//                   taskController.addTask(task);
//                 }
//                 Get.back(); // Close the dialog
//               },
//               child: Text('Save'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.back(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   // void _openBottomSheet(BuildContext context, TaskController taskController, int index) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return Container(
//   //         padding: EdgeInsets.all(16.0),
//   //         child: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             ListTile(
//   //               leading: Icon(Icons.delete, color: Colors.red),
//   //               title: Text('Delete Task'),
//   //               onTap: () {
//   //                 taskController.deleteTask(index);
//   //                 Get.back(); // Close the bottom sheet
//   //               },
//   //             ),
//   //             ListTile(
//   //               leading: Icon(Icons.cancel),
//   //               title: Text('Cancel'),
//   //               onTap: () {
//   //                 Get.back(); // Close the bottom sheet
//   //               },
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//
// }
//
//





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalsync/controller/task_controller.dart';
import 'package:goalsync/screens/task_screen.dart';

import '../controller/theme_controller.dart';

// class HabitScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TaskController taskController = Get.find();
//
//     return Scaffold(
//       appBar: _appBar(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(17.0),
//             child: Row(
//               children: [],
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (taskController.isTaskSelected.length < taskController.taskList.length) {
//                 taskController.isTaskSelected.addAll(
//                   List.generate(
//                     taskController.taskList.length - taskController.isTaskSelected.length,
//                         (_) => false,
//                   ),
//                 );
//               }
//
//               return ListView.builder(
//                 itemCount: taskController.taskList.length,
//                 itemBuilder: (context, index) {
//                   return Dismissible(
//                     key: ValueKey(taskController.taskList[index]),
//                     background: Container(
//                       color: Colors.blue.shade300,
//                       child: Icon(Icons.delete_outline, size: 35),
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                     ),
//                     direction: DismissDirection.endToStart,
//                     onDismissed: (direction) {
//                       taskController.deleteTask(index);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(TaskScreen(
//                             taskName: taskController.taskList[index],
//                             isTaskChecked: taskController.isTaskSelected[index],
//
//                           ));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 5.0),
//                           padding: EdgeInsets.all(6.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: Colors.black54, width: 2),
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   taskController.taskList[index],
//                                   style: TextStyle(color: Colors.black, fontSize: 18),
//                                 ),
//                               ),
//                               Checkbox(
//                                 value: taskController.isTaskSelected[index],
//                                 onChanged: (bool? value) {
//                                   if (value != null) {
//                                     taskController.toggleTaskSelection(index, value);
//                                   }
//                                 },
//                                 activeColor: Colors.blue,
//                                 checkColor: Colors.white,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           )
//         ],
//       ),
//     );
//   }
//
//   AppBar _appBar() {
//     return AppBar(
//       title: Text("Habit Screen"),
//       backgroundColor: Colors.blue,
//       actions: [
//         TextButton(
//           onPressed: () {
//             _showAddTaskDialog();
//           },
//           child: Text(
//             'Add Task',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _showAddTaskDialog() {
//     final TaskController taskController = Get.find();
//     final TextEditingController taskControllerInput = TextEditingController();
//
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add New Task'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: taskControllerInput,
//                 decoration: InputDecoration(hintText: 'Enter task'),
//                 autofocus: true,
//               ),
//
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 final task = taskControllerInput.text.trim();
//                 if (task.isNotEmpty) {
//                   taskController.addTask(task);
//                 }
//                 Get.back(); // Close the dialog
//               },
//               child: Text('Save'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.back(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }





class HabitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Habits"),
        actions: [
          TextButton(
            onPressed: () {
              _showAddTaskDialog();
            },
            child: Text(
              '+ ',
              style: TextStyle(
                color: Theme.of(context).iconTheme.color, // Use theme icon color
                fontSize: 35,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Use GetX to change the theme reactively
              themeController.changeTheme();
            },
            child: Obx(() {
              return Icon(
                themeController.isDark.value ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).iconTheme.color, // Use theme icon color
              );
            }),
          ),
          SizedBox(width: 16), // Optional: add spacing between icons
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              children: [],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (taskController.isTaskSelected.length < taskController.taskList.length) {
                taskController.isTaskSelected.addAll(
                  List.generate(
                    taskController.taskList.length - taskController.isTaskSelected.length,
                        (_) => false,
                  ),
                );
              }

              return ListView.separated(
                itemCount: taskController.taskList.length,
                separatorBuilder: (context, index) => SizedBox(height: 16), // Space between items
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(taskController.taskList[index]),
                    background: Container(
                      color: Colors.blue.shade300,
                      child: Icon(Icons.delete_outline, size: 35, color: Colors.white),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      taskController.deleteTask(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        color: Theme.of(context).listTileTheme.tileColor, // Use theme tile color
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor, // Use theme card color
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Theme.of(context).cardColor, width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5), // Shadow color for better visibility
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(TaskScreen(
                                      taskName: taskController.taskList[index],
                                      isTaskChecked: taskController.isTaskSelected[index],
                                    ));
                                  },
                                  child: Text(
                                    taskController.taskList[index],
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodyLarge!.color, // Use theme text color
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // Space between container and checkbox
                            Checkbox(
                              value: taskController.isTaskSelected[index],
                              onChanged: (bool? value) {
                                if (value != null) {
                                  taskController.toggleTaskSelection(index, value);
                                }
                              },
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog() {
    final TaskController taskController = Get.find();
    final TextEditingController taskControllerInput = TextEditingController();

    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskControllerInput,
                decoration: InputDecoration(hintText: 'Enter task'),
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final task = taskControllerInput.text.trim();
                if (task.isNotEmpty) {
                  taskController.addTask(task);
                }
                Get.back(); // Close the dialog
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
