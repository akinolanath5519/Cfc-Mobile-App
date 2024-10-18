import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ClearingPage extends StatefulWidget {
  const ClearingPage({super.key});

  @override
  _ClearingPageState createState() => _ClearingPageState();
}

class _ClearingPageState extends State<ClearingPage> {
  int _selectedOption = 0;
  final String _imagePath =
      'assets/images/clearing.jpg'; // Background image path

  @override
  void initState() {
    super.initState();
    _checkImage(); // Check the image when the widget is initialized
  }

  Future<void> _checkImage() async {
    try {
      await rootBundle
          .load(_imagePath); // Load the image to ensure the path is correct
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
        decoration: _buildBackgroundDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 8),
              _buildSubtitle(),
              const SizedBox(height: 10),
              _buildButtonList(),
              const SizedBox(height: 15), // Space at the bottom of the buttons
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(_imagePath),
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 6),
        const Expanded(
          child: Text(
            'Clearing Documents Processing',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 235, 22, 11),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return const Center(
      child: Text(
        'Select the type of process you want',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 3, 37, 66),
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildButtonList() {
    final buttonLabels = [
      'FORM M PROCESSING',
      'PAAR PROCESSING',
      'EXPORT PROCESSING',
      'OTHER PAYMENT',
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: buttonLabels.length,
        itemBuilder: (context, index) {
          return _buildButton(buttonLabels[index], index + 1);
        },
      ),
    );
  }

  Widget _buildButton(String label, int value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.85),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Color.fromARGB(255, 9, 134, 237),
                width: 2,
              ),
            ),
            shadowColor: Colors.black.withOpacity(0.2),
            elevation: 5,
          ),
          onPressed: () async {
            _selectedOption = value; // Update selected option
            print(value);
            setState(() {});
            if (value == 1) {
              final Uri _url = Uri.parse(
                  'https://cfcterminal.com/documentations/add-form-m/');

              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            } else if (value == 2) {
              final Uri _url =
                  Uri.parse('https://cfcterminal.com/documentations/add-paar/');

              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            } else if (value == 3) {
              final Uri _url = Uri.parse(
                  'https://cfcterminal.com/documentations/export-processing/');

              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            } else {
              final Uri _url = Uri.parse(
                  'https://cfcterminal.com/documentations/other-payment/');

              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
              _buildRadio(value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadio(int value) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.red),
      child: Radio(
        value: value,
        groupValue: _selectedOption,
        activeColor: Colors.red,
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        onChanged: (int? newValue) {
          setState(() {
            _selectedOption = newValue!;
          });
        },
      ),
    );
  }
}
