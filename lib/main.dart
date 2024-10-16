import 'package:flutter/material.dart';
import 'package:cfc/widgets/bottom_navigation.dart'; // Import your custom Appbar widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cfc',
      theme: _buildAppTheme(),
      home: const Appbar(), // Set Appbar as the home screen
    );
  }

  /// Builds the app theme with custom AppBar settings.
  ThemeData _buildAppTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        toolbarHeight: 51, // Set AppBar height to 51px
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove AppBar shadow
      ),
    );
  }
}
