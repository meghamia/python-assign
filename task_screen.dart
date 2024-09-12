// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../controller/task_controller.dart';
//
// class TaskScreen extends StatelessWidget {
//   final String taskName;
//   final bool isTaskChecked;
//
//   TaskScreen({required this.taskName, required this.isTaskChecked});
//
//   Future<Map<String, List<double>>> fetchAllProgressData(
//       TaskController taskController) async {
//     final currentWeekData = await taskController.fetchProgressDataForWeek(taskName);
//     final previousWeekData = await taskController.fetchProgressDataForPreviousWeek(taskName);
//     return {
//       'currentWeek': currentWeekData,
//       'previousWeek': previousWeekData,
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final TaskController taskController = Get.find();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Task Details"),
//         backgroundColor: Colors.blue,
//       ),
//       body: FutureBuilder<Map<String, List<double>>>(
//         future: fetchAllProgressData(taskController),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('No data available.'));
//           }
//
//           final currentWeekData = snapshot.data!['currentWeek']!;
//           final previousWeekData = snapshot.data!['previousWeek']!;
//
//           if (!isTaskChecked) {
//             return Center(child: Text('No data available for this task.'));
//           }
//
//           final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
//           final today = DateTime.now();
//           final currentDayIndex = (today.weekday - DateTime.monday + 7) % 7;
//
//           List<Widget> charts = [];
//
//           // Create Current Week Chart
//           final currentWeekProgressData = List<double>.filled(7, 0.0);
//           for (int i = 0; i < currentWeekData.length; i++) {
//             currentWeekProgressData[i] = currentWeekData[i];
//           }
//
//           final currentWeekBarGroups =
//               currentWeekProgressData.asMap().entries.map((entry) {
//             int index = entry.key;
//             double value = entry.value;
//             Color barColor = Colors.blue;
//             double barHeight = value;
//
//             if (index < currentDayIndex) {
//               if (value == 0.0) {
//                 barColor = Colors.grey;
//                 barHeight = 0.2;
//               } else {
//                 barColor = Colors.blue;
//                 barHeight = value;
//               }
//             } else if (index > currentDayIndex) {
//               barColor = Colors.transparent;
//               barHeight = 0.0;
//             }
//
//             return BarChartGroupData(
//               x: index,
//               barRods: [
//                 BarChartRodData(
//                   toY: barHeight,
//                   color: barColor,
//                   width: 20,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ],
//             );
//           }).toList();
//
//           charts.add(
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Current Week',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   height: 300,
//                   child: BarChart(
//                     BarChartData(
//                       alignment: BarChartAlignment.spaceAround,
//                       maxY: currentWeekProgressData.isNotEmpty
//                           ? currentWeekProgressData
//                                   .reduce((a, b) => a > b ? a : b) +
//                               1
//                           : 1,
//                       barGroups: currentWeekBarGroups,
//                       titlesData: FlTitlesData(
//                         bottomTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 40,
//                             getTitlesWidget: (value, meta) {
//                               final dayLabel = daysOfWeek[value.toInt() % 7];
//                               return SideTitleWidget(
//                                 axisSide: meta.axisSide,
//                                 child: Text(dayLabel,
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold)),
//                               );
//                             },
//                           ),
//                         ),
//                         leftTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 40,
//                             getTitlesWidget: (value, meta) {
//                               return SideTitleWidget(
//                                 axisSide: meta.axisSide,
//                                 child: Text('${value.toInt()}',
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold)),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       borderData: FlBorderData(
//                         show: true,
//                         border: Border.all(
//                             color: const Color(0xff37434d), width: 1),
//                       ),
//                       gridData: FlGridData(show: true),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//
//           // Create Previous Week Chart
//           final previousWeekProgressData = List<double>.filled(7, 0.0);
//           for (int i = 0; i < previousWeekData.length; i++) {
//             previousWeekProgressData[i] = previousWeekData[i];
//           }
//
//           final previousWeekBarGroups =
//               previousWeekProgressData.asMap().entries.map((entry) {
//             int index = entry.key;
//             double value = entry.value;
//             Color barColor = value == 1.0 ? Colors.blue : Colors.grey;
//             double barHeight = value == 1.0 ? 1.0 : 0.1;
//
//             return BarChartGroupData(
//               x: index,
//               barRods: [
//                 BarChartRodData(
//                   toY: barHeight,
//                   color: barColor,
//                   width: 20,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ],
//             );
//           }).toList();
//
//           charts.add(
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Previous Week',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   height: 300,
//                   child: BarChart(
//                     BarChartData(
//                       alignment: BarChartAlignment.spaceAround,
//                       maxY: previousWeekProgressData.isNotEmpty
//                           ? previousWeekProgressData
//                                   .reduce((a, b) => a > b ? a : b) +
//                               1
//                           : 1,
//                       barGroups: previousWeekBarGroups,
//                       titlesData: FlTitlesData(
//                         bottomTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 40,
//                             getTitlesWidget: (value, meta) {
//                               final dayLabel = daysOfWeek[value.toInt() % 7];
//                               return SideTitleWidget(
//                                 axisSide: meta.axisSide,
//                                 child: Text(dayLabel,
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold)),
//                               );
//                             },
//                           ),
//                         ),
//                         leftTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 40,
//                             getTitlesWidget: (value, meta) {
//                               return SideTitleWidget(
//                                 axisSide: meta.axisSide,
//                                 child: Text('${value.toInt()}',
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold)),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       borderData: FlBorderData(
//                         show: true,
//                         border: Border.all(
//                             color: const Color(0xff37434d), width: 1),
//                       ),
//                       gridData: FlGridData(show: true),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//
//           return PageView(
//             children: charts,
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//






import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/task_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class TaskScreen extends StatelessWidget {
  final String taskName;
  final bool isTaskChecked;

  TaskScreen({required this.taskName, required this.isTaskChecked});

  Future<Map<String, List<double>>> fetchAllProgressData(
      TaskController taskController) async {
    final currentWeekData = await taskController.fetchProgressDataForWeek(taskName);
    return {
      'currentWeek': currentWeekData,
    };
  }

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Map<String, List<double>>>(
        future: fetchAllProgressData(taskController),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.containsKey('currentWeek')) {
            return Center(child: Text('No data available.'));
          }

          final currentWeekData = snapshot.data!['currentWeek']!;

          if (!isTaskChecked) {
            return Center(child: Text('No data available for this task.'));
          }

          final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
          final today = DateTime.now();
          final currentDayIndex = (today.weekday - DateTime.monday + 7) % 7;

          List<Widget> charts = [];

          // Create Current Week Chart
          final currentWeekProgressData = List<double>.filled(7, 0.0);
          for (int i = 0; i < currentWeekData.length; i++) {
            currentWeekProgressData[i] = currentWeekData[i];
          }

          final currentWeekBarGroups = currentWeekProgressData.asMap().entries.map((entry) {
            int index = entry.key;
            double value = entry.value;
            Color barColor = Colors.blue;
            double barHeight = value;

            if (index < currentDayIndex) {
              if (value == 0.0) {
                barColor = Colors.grey;
                barHeight = 0.2;
              } else {
                barColor = Colors.blue;
                barHeight = value;
              }
            } else if (index > currentDayIndex) {
              barColor = Colors.transparent;
              barHeight = 0.0;
            }

            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: barHeight,
                  color: barColor,
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }).toList();

          charts.add(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text(
                    taskName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.all(17.0),
                //   child: Text(
                //     'Current Week',
                //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //   ),
                // ),
                SizedBox(height: 20),
                Container(
                  height: 300,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: currentWeekProgressData.isNotEmpty
                          ? currentWeekProgressData
                          .reduce((a, b) => a > b ? a : b) + 1
                          : 1,
                      barGroups: currentWeekBarGroups,
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              final dayLabel = daysOfWeek[value.toInt() % 7];
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(dayLabel,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text('${value.toInt()}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                            color: const Color(0xff37434d), width: 1),
                      ),
                      gridData: FlGridData(show: true),
                    ),
                  ),
                ),
              ],
            ),
          );

          return ListView(children: charts);
        },
      ),
    );
  }
}




