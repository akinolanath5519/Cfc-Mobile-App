import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for rootBundle

class CustomDutyPage extends StatefulWidget {
  const CustomDutyPage({super.key});

  @override
  _CustomDutyPageState createState() => _CustomDutyPageState();
}

class _CustomDutyPageState extends State<CustomDutyPage> {
  int _selectedOption = 0; // Variable to track the selected radio button
  final String _imagePath =
      'assets/images/custom_duty.jpg'; // Background image path

  @override
  void initState() {
    super.initState();
    _checkImage(); // Check the image when the widget is initialized
  }

  Future<void> _checkImage() async {
    try {
      await rootBundle.load(_imagePath); // Attempt to load the image
      print('Image loaded successfully: $_imagePath');
    } catch (e) {
      print('Error loading image: $_imagePath\n$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _backgroundDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 10), // Space before buttons
              _buildButtonList(), // Button list centered
              const SizedBox(height: 15), // Space at the bottom of the buttons
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _backgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(_imagePath),
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(
          Colors.black54,
          BlendMode.darken,
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Back button icon
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
        const SizedBox(width: 6), // Space between button and text
        const Expanded(
          child: Text(
            'Custom Duty Processing',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 235, 22, 11), // Red heading
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildButtonList() {
    const buttonLabels = ['CUSTOM DUTY PROCESSING']; // Button labels

    return Expanded(
      child: Center(
        child: ListView.builder(
          itemCount: buttonLabels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 12), // Space between buttons
              child: _buildButton(buttonLabels[index], index),
            );
          },
        ),
      ),
    );
  }

  SizedBox _buildButton(String label, int index) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white
              .withOpacity(0.85), // Slightly transparent white background
          padding: const EdgeInsets.symmetric(
              vertical: 10), // Increased height for buttons
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Smooth corners
            side: const BorderSide(
              color:
                  Color.fromARGB(255, 9, 134, 237), // Blue border for buttons
              width: 2, // Border size
            ),
          ),
          shadowColor: Colors.black.withOpacity(0.2), // Add shadow color
          elevation: 5, // Slight elevation for shadow effect
        ),
        onPressed: () {
          setState(() {
            _selectedOption = index + 1; // Update selected option
          });
        },
        child: _buildButtonContent(label, index),
      ),
    );
  }

  Row _buildButtonContent(String label, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, // Space between label and radio button
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.red, // Red text color
            ),
          ),
        ),
        Theme(
          data: ThemeData(
            unselectedWidgetColor:
                Colors.red, // Red border for unselected radio button
          ),
          child: Radio(
            value: index + 1,
            groupValue: _selectedOption,
            activeColor: Colors.red, // Red color for active radio button
            visualDensity: const VisualDensity(
                horizontal: -2, vertical: -2), // Increase the size
            onChanged: (int? value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
