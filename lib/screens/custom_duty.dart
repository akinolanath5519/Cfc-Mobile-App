import 'package:cfc/screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // _buildHeader(),
              const SizedBox(height: 150), // Space before buttons
              _buildButtonList(), // Button list centered
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

  Expanded _buildButtonList() {
    const buttonLabels = [
      'CUSTOM DUTY PROCESSING',
      'OTHER PAYMENT',
    ]; // Button labels

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
            setState(() {});
            print("value $value");

            if (value == 0) {
              Get.to(() => WebViewGen(
                    url:
                        'https://cfcterminal.com/documentations/add-duty-payment/',
                  ));
              // final Uri _url = Uri.parse(
              //     'https://cfcterminal.com/documentations/add-form-m/');

              // if (!await launchUrl(_url)) {
              //   throw Exception('Could not launch $_url');
              // }
            } else if (value == 1) {
              Get.to(() => WebViewGen(
                    url:
                        'https://cfcterminal.com/documentations/other-payment/',
                  ));
              // final Uri _url =
              //     Uri.parse('https://cfcterminal.com/documentations/add-paar/');

              // if (!await launchUrl(_url)) {
              //   throw Exception('Could not launch $_url');
              // }
            } else if (value == 3) {
              Get.to(() => WebViewGen(
                    url:
                        'https://cfcterminal.com/documentations/export-processing/',
                  ));

              // final Uri _url = Uri.parse(
              //     'https://cfcterminal.com/documentations/export-processing/');

              // if (!await launchUrl(_url)) {
              //   throw Exception('Could not launch $_url');
              // }
            } else {
              Get.to(() => WebViewGen(
                    url:
                        'https://cfcterminal.com/documentations/other-payment/',
                  ));

              // final Uri _url = Uri.parse(
              //     'https://cfcterminal.com/documentations/other-payment/');

              // if (!await launchUrl(_url)) {
              //   throw Exception('Could not launch $_url');
              // }
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
