import 'package:flutter/material.dart';

/// A function to build a custom AppBar with gradient background and buttons.
PreferredSizeWidget buildCustomAppBar(int selectedIndex, Function(int) onItemTapped) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFED0006), // Red
            Color.fromRGBO(52, 0, 206, 0.76), // Blue
          ],
        ),
      ),
      child: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildNavigationButtons(selectedIndex, onItemTapped),
        ),
      ),
    ),
  );
}

/// Builds a list of navigation buttons for the AppBar.
List<Widget> _buildNavigationButtons(int selectedIndex, Function(int) onItemTapped) {
  final buttonConfigs = [
    {'icon': Icons.clear, 'label': 'Clearing'},
    {'icon': Icons.local_shipping, 'label': 'Logistics'},
    {'icon': Icons.money, 'label': 'Customs Duty'},
    {'icon': Icons.phone, 'label': 'Contact Us'},
  ];

  return List.generate(buttonConfigs.length, (index) {
    return _buildButton(
      buttonConfigs[index]['icon'] as IconData,
      buttonConfigs[index]['label'] as String,
      index,
      selectedIndex == index,
      onItemTapped,
    );
  });
}

/// Builds a navigation button for the AppBar with custom colors.
Widget _buildButton(IconData icon, String label, int index, bool isSelected, Function(int) onItemTapped) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: isSelected ? 0 : 5),
    decoration: isSelected
        ? BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          )
        : null,
    child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      ),
      onPressed: () => onItemTapped(index),
      child: _buildButtonContent(icon, label, isSelected),
    ),
  );
}

/// Builds the content of a navigation button.
Widget _buildButtonContent(IconData icon, String label, bool isSelected) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icon,
        size: 26,
        color: Colors.white,
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected
              ? const Color.fromARGB(255, 209, 24, 11)
              : Colors.white,
        ),
      ),
    ],
  );
}
