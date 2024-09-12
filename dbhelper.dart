// import 'package:intl/intl.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   DatabaseHelper._internal();
//
//   static Database? _database;
//
//   // Static constants for table and column names
//   static const String _tableTasks = 'tasks';
//   static const String _columnId = 'id';
//   static const String _columnTask = 'task';
//   static const String _columnIsChecked = 'is_checked';
//   static const String _columnProgress = 'progress';
//   static const String _columnCreatedDate = 'created_date';
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'tasks.db');
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE $_tableTasks (
//             $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//             $_columnTask TEXT UNIQUE,
//             $_columnIsChecked INTEGER,
//             $_columnProgress REAL,
//             $_columnCreatedDate TEXT
//           )
//         ''');
//       },
//     );
//   }
//
//   Future<List<Map<String, dynamic>>> getTasks() async {
//     final db = await database;
//     return await db.query(_tableTasks);
//   }
//
//   Future<int?> insertTask(
//       String task, bool isChecked, double progress, String createdDate) async {
//     final db = await database;
//     try {
//       return await db.insert(
//         _tableTasks,
//         {
//           _columnTask: task,
//           _columnIsChecked: isChecked ? 1 : 0,
//           _columnProgress: progress,
//           _columnCreatedDate: createdDate,
//         },
//         conflictAlgorithm: ConflictAlgorithm.ignore,
//       );
//     } catch (e) {
//       print("Error inserting task: $e");
//       return null;
//     }
//   }
//
//   Future<int> deleteTask(String task) async {
//     final db = await database;
//     return await db.delete(
//       _tableTasks,
//       where: '$_columnTask = ?',
//       whereArgs: [task],
//     );
//   }
//
//   Future<int> updateTask(String oldTask, String newTask, bool isChecked,
//       double progress, String updatedDate) async {
//     final db = await database;
//     return await db.update(
//       _tableTasks,
//       {
//         _columnTask: newTask,
//         _columnIsChecked: isChecked ? 1 : 0,
//         _columnProgress: progress,
//         _columnCreatedDate: updatedDate,
//       },
//       where: '$_columnTask = ?',
//       whereArgs: [oldTask],
//     );
//   }
//
//   Future<List<Map<String, dynamic>>> getTaskProgressForRange(
//       String taskName, String startDate, String endDate) async {
//     final db = await database;
//     final results = await db.query(
//       _tableTasks,
//       where: '$_columnTask = ? AND $_columnCreatedDate BETWEEN ? AND ?',
//       whereArgs: [taskName, startDate, endDate],
//     );
//     //final progressData = await getTaskProgressForRange(taskName, startDate, endDate);
//     print('Queried Data: $results');
//     return results;
//   }
//
//   Future<List<double>> fetchProgressDataForWeek(String taskName) async {
//     final now = DateTime.now();
//     final currentWeekday = now.weekday;
//
//     // Calculate the start and end of the week (Monday to Sunday)
//     final startOfWeek =
//         now.subtract(Duration(days: currentWeekday - DateTime.monday));
//     final endOfWeek = now.add(Duration(days: DateTime.sunday - currentWeekday));
//
//     final startDate = DateFormat('yyyy-MM-dd').format(startOfWeek);
//     final endDate = DateFormat('yyyy-MM-dd').format(endOfWeek);
//
//     print('Fetching data from $startDate to $endDate');
//
//     try {
//       final progressData =
//           await getTaskProgressForRange(taskName, startDate, endDate);
//
//       // Initialize result list with zeros for all 7 days
//       final result = List<double>.filled(7, 0.0);
//
//       // Populate result list with actual data
//       if (progressData.isNotEmpty) {
//         for (var entry in progressData) {
//           final dateString = entry[_columnCreatedDate] as String?;
//           final progressValue = entry[_columnProgress] as double?;
//
//           if (dateString != null && progressValue != null) {
//             final date = DateTime.parse(dateString).toLocal();
//             final dayOfWeek = (date.weekday - DateTime.monday + 7) %
//                 7; // Adjust to match Monday start
//             if (dayOfWeek >= 0 && dayOfWeek < 7) {
//               result[dayOfWeek] = progressValue;
//             }
//           }
//         }
//       } else {
//         print('No progress data found for the specified range.');
//       }
//
//       //  current day's bar is visible with the correct progress
//       final currentDayIndex = (now.weekday - DateTime.monday + 7) % 7;
//       if (result[currentDayIndex] == 0.0) {
//         result[currentDayIndex] = 1.0; //  current day's bar shows 1.0 progress if the task is completed
//       }
//
//       print('Progress Data for the Week: $result');
//       return result;
//     } catch (e) {
//       print('Error fetching progress data: $e');
//       return List<double>.filled(7, 0.0);
//     }
//   }
//
//   Future<List<double>> fetchProgressDataForPreviousWeek(String taskName) async {
//     final now = DateTime.now();
//     final currentWeekday = now.weekday;
//
//     // current week monday
//     final mondayOfCurrentWeek = now.subtract(Duration(days: (currentWeekday - 1) % 7));
//
//      // Calculate Start and End of Previous Week
//     final startOfPreviousWeek = mondayOfCurrentWeek.subtract(Duration(days: 7));
//     final endOfPreviousWeek = mondayOfCurrentWeek.subtract(Duration(days: 1));
//
//
//     final startDate = DateFormat('yyyy-MM-dd').format(startOfPreviousWeek);
//     final endDate = DateFormat('yyyy-MM-dd').format(endOfPreviousWeek);
//     print('Monday of Current Week: $mondayOfCurrentWeek');
//     print('Start of Previous Week: $startOfPreviousWeek');
//     print('End of Previous Week: $endOfPreviousWeek');
//
//     print('Fetching data from $startDate to $endDate');
//
//     try {
//       final progressData =
//           await getTaskProgressForRange(taskName, startDate, endDate);
//
//       print('Fetched Data: $progressData');
//
//       final result = List<double>.filled(7, 0.0);
//
//       if (progressData.isNotEmpty) {
//         for (var entry in progressData) {
//           final dateString = entry[_columnCreatedDate] as String?;
//           final progressValue = entry[_columnProgress] as double?;
//
//           print('Date String: $dateString, Progress Value: $progressValue');
//
//           if (dateString != null && progressValue != null) {
//             final date = DateTime.parse(dateString).toLocal();
//             final dayOfWeek = (date.weekday - DateTime.monday + 7) % 7; // Adjust to match Monday start
//             print('Day of Week: $dayOfWeek');
//             if (dayOfWeek >= 0 && dayOfWeek < 7) {
//               result[dayOfWeek] = progressValue;
//             }
//           }
//         }
//       } else {
//         print('No progress data found for the specified range.');
//       }
//
//       print('Progress Data for the Previous Week: $result');
//       return result;
//     } catch (e) {
//       print('Error fetching progress data: $e');
//       return List<double>.filled(7, 0.0);
//     }
//   }
// }





import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  // Static constants for table and column names
  static const String _tableTasks = 'tasks';
  static const String _columnId = 'id';
  static const String _columnTask = 'task';
  static const String _columnIsChecked = 'is_checked';
  static const String _columnProgress = 'progress';
  static const String _columnCreatedDate = 'created_date';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE $_tableTasks (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_columnTask TEXT UNIQUE,
            $_columnIsChecked INTEGER,
            $_columnProgress REAL,
            $_columnCreatedDate TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query(_tableTasks);
  }

  Future<int?> insertTask(String task, bool isChecked, double progress, String createdDate) async {
    final db = await database;
    try {
      return await db.insert(
        _tableTasks,
        {
          _columnTask: task,
          _columnIsChecked: isChecked ? 1 : 0,
          _columnProgress: progress,
          _columnCreatedDate: createdDate,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } catch (e) {
      print("Error inserting task: $e");
      return null;
    }
  }

  Future<int> deleteTask(String task) async {
    final db = await database;
    return await db.delete(
      _tableTasks,
      where: '$_columnTask = ?',
      whereArgs: [task],
    );
  }

  Future<int> updateTask(String oldTask, String newTask, bool isChecked, double progress, String updatedDate) async {
    final db = await database;
    return await db.update(
      _tableTasks,
      {
        _columnTask: newTask,
        _columnIsChecked: isChecked ? 1 : 0,
        _columnProgress: progress,
        _columnCreatedDate: updatedDate,
      },
      where: '$_columnTask = ?',
      whereArgs: [oldTask],
    );
  }

  Future<List<double>> fetchProgressDataForWeek(String taskName) async {
    final now = DateTime.now().toUtc(); // Current date in UTC
    final currentWeekday = now.weekday;

    // Start and end of the current week (Monday to current day)
    final startOfWeek = now.subtract(Duration(days: currentWeekday - DateTime.monday)).toUtc();
    final endOfWeek = now; // Current day

    final startDate = startOfWeek.toIso8601String(); // Query range start (in ISO format)
    final endDate = endOfWeek.toIso8601String(); // Query range end (in ISO format)

    print('Fetching progress data for week from $startDate to $endDate for task: $taskName');

    try {
      // Fetch data for the task within the specified date range
      final progressData = await getTaskProgressForRange(taskName, startDate, endDate);

      print('Queried Data: $progressData');

      // Initialize result list for storing daily progress (Mon-Sun)
      final result = List<double>.filled(7, 0.0);

      for (var entry in progressData) {
        final dateString = entry[_columnCreatedDate] as String?;
        final progressValue = entry[_columnProgress];

        if (dateString != null && progressValue != null) {
          final date = DateTime.parse(dateString).toUtc();

          // Calculate the index of the date in the week (0 = Monday, 6 = Sunday)
          final dayOfWeekIndex = (date.weekday - DateTime.monday + 7) % 7;

          if (dayOfWeekIndex >= 0 && dayOfWeekIndex < 7) {
            result[dayOfWeekIndex] = progressValue; // Store the progress value for that day
          }
        }
      }

      // Ensure that today's progress is included (if not recorded)
      final todayIndex = (now.weekday - DateTime.monday + 7) % 7;
      if (result[todayIndex] == 0.0) {
        result[todayIndex] = 1.0; // Example: If no progress data, set today's bar to 1.0
      }

      print('Final progress data for the week: $result');
      return result;
    } catch (e) {
      print('Error fetching progress data: $e');
      return List<double>.filled(7, 0.0); // Return default empty data if error occurs
    }
  }

  Future<List<Map<String, dynamic>>> getTaskProgressForRange(String taskName, String startDate, String endDate) async {
    final db = await database;
    print('Querying progress for task: $taskName from $startDate to $endDate');

    // Check if the query parameters are correct
    print('Task Name: $taskName');
    print('Start Date: $startDate');
    print('End Date: $endDate');

    try {
      final results = await db.query(
        _tableTasks,
        where: '$_columnTask = ? AND $_columnCreatedDate BETWEEN ? AND ?',
        whereArgs: [taskName, startDate, endDate],
      );

      print('Queried Data: $results'); // Print queried data
      return results;
    } catch (e) {
      print('Error querying progress data: $e');
      return [];
    }
  }

  // Debugging method to print all records in the database
  Future<void> printAllRecords() async {
    final db = await database;
    final results = await db.query(_tableTasks);
    for (var record in results) {
      print('Record: $record');
    }
  }
}
