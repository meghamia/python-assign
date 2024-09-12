import 'package:flutter/material.dart';
import 'package:get/get.dart';


final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.white
    )

);
final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black12,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black12, // Slightly lighter black for the background
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.grey.shade800, // Lighter shade of black for the tile
    textColor: Colors.white, // White text for better contrast
    iconColor: Colors.white, // White icons for better visibility
    selectedTileColor: Colors.grey[800], // Color when the tile is selected
  ),
  scaffoldBackgroundColor: Colors.grey.shade800, // Background color of the scaffold
  cardColor: Colors.grey.shade800, // Card color to match the ListTile
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade800, // Set AppBar background color to green
    iconTheme: IconThemeData(color: Colors.white), // Set icon color in AppBar

  ),
);
