import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for rootBundle

class LogisticsPage extends StatefulWidget {
  const LogisticsPage({super.key});

  @override
  _LogisticsPageState createState() => _LogisticsPageState();
}

class _LogisticsPageState extends State<LogisticsPage> {
  int _selectedOption = 0; // Variable to track the selected radio button
  String _imagePath = 'assets/images/Logistics.jpg'; // Background image path

  @override
  void initState() {
    super.initState();
    _checkImage(); // Check the image when the widget is initialized
  }

  Future<void> _checkImage() async {
    try {
      // Attempt to load the image to ensure the path is correct
      await rootBundle.load(_imagePath);
      print('Image loaded successfully: $_imagePath');
    } catch (e) {
      print('Error loading image: $_imagePath\n$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double
            .infinity, // Set the container width to take all available space
        height: double
            .infinity, // Set the container height to take all available space
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_imagePath), // Background image path
            fit: BoxFit.cover, // Cover the background entirely
            colorFilter: const ColorFilter.mode(Colors.black54,
                BlendMode.darken), // Darken background for text readability
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24), // Adjust padding for responsiveness
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2), // Space between top and text
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black), // Back button icon
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                  const SizedBox(width: 6), // Space between button and text
                  const Expanded(
                    child: Text(
                      'Clearing Documents Processing',
                      style: TextStyle(
                        fontSize: 17, // Increased font size
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 22, 11), // Red heading
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8), // Space between title and subtitle

              const SizedBox(height: 10), // Space before buttons

              // Button List with Radio buttons
              Expanded(
                // Allows the Column to take available space
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center the button in the column
                    children: List.generate(1, (index) {
                      // Button labels for each option
                      final buttonLabels = [
                        'LOGISTICS PROCESSING',
                      ];

                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 12), // Space between buttons
                        child: SizedBox(
                          width: double
                              .infinity, // Button width set to take all available space
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(
                                  0.85), // Slightly transparent white background
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10), // Increased height for buttons
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // Smooth corners
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 9, 134,
                                      237), // Blue border for buttons
                                  width: 2, // Border size
                                ),
                              ),
                              shadowColor: Colors.black
                                  .withOpacity(0.2), // Add shadow color
                              elevation:
                                  5, // Slight elevation for shadow effect
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedOption =
                                    index + 1; // Update selected option
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Space between label and radio button
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    buttonLabels[
                                        index], // Dynamic label for each button
                                    style: const TextStyle(
                                      fontSize: 14, // Increased font size
                                      color: Colors.red, // Red text color
                                    ),
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors
                                        .red, // Red border for unselected radio button
                                  ),
                                  child: Radio(
                                    value: index + 1,
                                    groupValue: _selectedOption,
                                    activeColor: Colors
                                        .red, // Red color for active radio button
                                    visualDensity: const VisualDensity(
                                        horizontal: -2,
                                        vertical: -2), // Increase the size
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 15), // Space at the bottom of the buttons
            ],
          ),
        ),
      ),
    );
  }
}
