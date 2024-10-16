import 'package:flutter/material.dart';
import 'package:cfc/screens/clearing.dart';
import 'package:cfc/screens/contact_us.dart';
import 'package:cfc/screens/custom_duty.dart';
import 'package:cfc/screens/logistics.dart';
import 'package:cfc/widgets/app_bar_widget.dart'; // Import the shared AppBar widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ClearingPage(),
    LogisticsPage(),
    CustomDutyPage(),
    ContactUsPage(),
    // Add other pages as necessary
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _shouldShowAppBar() 
          ? buildCustomAppBar(_selectedIndex, _onItemTapped) 
          : null, // Conditionally show AppBar
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
    );
  }

  bool _shouldShowAppBar() {
    return _selectedIndex < _pages.length; // Modify this condition as needed
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
