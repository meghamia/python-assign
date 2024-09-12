// import 'package:get/get.dart';
// import '../database/dbhelper.dart';
//
// class TaskController extends GetxController {
//   final DatabaseHelper _databaseHelper = DatabaseHelper();
//   var taskList = <String>[].obs;
//   var isTaskSelected = <bool>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadTasks();
//   }
//
//   void loadTasks() async {
//     try {
//       final tasks = await _databaseHelper.getTasks();
//       taskList.value = tasks.map((task) => task['task'] as String).toList();
//       isTaskSelected.value = tasks.map((task) {
//         final isChecked = task['is_checked'];
//         return (isChecked != null && (isChecked as int) == 1);
//       }).toList();
//     } catch (e) {
//       print("Error loading tasks: $e");
//     }
//   }
//
//   void addTask(String task) async {
//     try {
//       bool isChecked = false;
//       double progress = 0.0;
//       String createdDate = DateTime.now().toIso8601String();
//
//       int? result = await _databaseHelper.insertTask(
//           task, isChecked, progress, createdDate);
//       if (result == null) {
//         print("Task already exists");
//       } else {
//         print("Task added successfully");
//         loadTasks();
//       }
//     } catch (e) {
//       print("Error adding task: $e");
//     }
//   }
//
//   void deleteTask(int index) async {
//     try {
//       String taskToDelete = taskList[index];
//       await _databaseHelper.deleteTask(taskToDelete);
//       taskList.removeAt(index);
//       isTaskSelected.removeAt(index);
//     } catch (e) {
//       print("Error deleting task: $e");
//     }
//   }
//
//   Future<void> toggleTaskSelection(int index, bool value) async {
//     try {
//       if (index < 0 || index >= taskList.length) {
//         throw ArgumentError("Index out of range");
//       }
//
//       String taskToUpdate = taskList[index];
//       double progress = value ? 1.0 : 0.0;
//       String updatedDate = DateTime.now().toIso8601String();
//
//       isTaskSelected[index] = value;
//       await _databaseHelper.updateTask(
//           taskToUpdate, taskToUpdate, value, progress, updatedDate);
//       print("Task updated successfully");
//     } catch (e) {
//       print("Error toggling task selection: $e");
//     }
//   }
//
//   // Future<List<double>> fetchProgressDataForWeek(String taskName) async {
//   //   return await _databaseHelper.fetchProgressDataForWeek(taskName);
//   // }
//   //
//   // Future<List<double>> fetchProgressDataForPreviousWeek(String taskName) async {
//   //   return await _databaseHelper.fetchProgressDataForPreviousWeek(taskName);
//   // }
//
//   Future<List<double>> fetchProgressDataForWeek(String taskName) async {
//     try {
//       print("Fetching progress data for the week for task: $taskName");
//       final progressData =
//       await _databaseHelper.fetchProgressDataForWeek(taskName);
//       print("Fetched weekly progress data: $progressData");
//       return progressData;
//     } catch (e) {
//       print("Error fetching weekly progress data: $e");
//       return List<double>.filled(7, 0.0);
//     }
//   }
//
//   Future<List<double>> fetchProgressDataForPreviousWeek(String taskName) async {
//     try {
//       print("Fetching progress data for the previous week for task: $taskName");
//       final progressData =
//       await _databaseHelper.fetchProgressDataForPreviousWeek(taskName);
//       print("Fetched previous week's progress data: $progressData");
//       return progressData;
//     } catch (e) {
//       print("Error fetching previous week's progress data: $e");
//       return List<double>.filled(7, 0.0);
//     }
//   }
// }









import 'package:get/get.dart';
import '../database/dbhelper.dart';

class TaskController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  var taskList = <String>[].obs;
  var isTaskSelected = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() async {
    try {
      final tasks = await _databaseHelper.getTasks();
      taskList.value = tasks.map((task) => task['task'] as String).toList();
      isTaskSelected.value = tasks.map((task) {
        final isChecked = task['is_checked'];
        return (isChecked != null && (isChecked as int) == 1);
      }).toList();
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }

  Future<void> addTask(String task) async {
    try {
      bool isChecked = false;
      double progress = 0.0;
      String createdDate = DateTime.now().toIso8601String();

      int? result = await _databaseHelper.insertTask(
          task, isChecked, progress, createdDate);
      if (result == null) {
        print("Task already exists");
      } else {
        print("Task added successfully");
        loadTasks();
      }
    } catch (e) {
      print("Error adding task: $e");
    }
  }

  void deleteTask(int index) async {
    try {
      String taskToDelete = taskList[index];
      await _databaseHelper.deleteTask(taskToDelete);
      taskList.removeAt(index);
      isTaskSelected.removeAt(index);
    } catch (e) {
      print("Error deleting task: $e");
    }
  }

  Future<void> toggleTaskSelection(int index, bool value) async {
    try {
      if (index < 0 || index >= taskList.length) {
        throw ArgumentError("Index out of range");
      }

      String taskToUpdate = taskList[index];
      double progress = value ? 1.0 : 0.0;
      String updatedDate = DateTime.now().toIso8601String();

      isTaskSelected[index] = value;
      await _databaseHelper.updateTask(
          taskToUpdate, taskToUpdate, value, progress, updatedDate);
      print("Task updated successfully");
    } catch (e) {
      print("Error toggling task selection: $e");
    }
  }


  Future<List<double>> fetchProgressDataForWeek(String taskName) async {
    try {
      print("Fetching progress data for the week for task: $taskName");
      final progressData =
      await _databaseHelper.fetchProgressDataForWeek(taskName);
      print("Fetched weekly progress data: $progressData");
      return progressData;
    } catch (e) {
      print("Error fetching weekly progress data: $e");
      return List<double>.filled(7, 0.0);
    }
  }

}
