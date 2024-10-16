import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Space at the top
            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Call Us Button
                ElevatedButton(
                  onPressed: () {
                    // Add your call functionality here
                    print('Call Us button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 206, 19, 6), // Green background color
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Call Us',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                // WhatsApp Button
                ElevatedButton(
                  onPressed: () {
                    // Add your WhatsApp functionality here
                    print('WhatsApp button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 206, 19, 6), // WhatsApp green color
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'WhatsApp',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Space after buttons
            Text(
              'Services Offered:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Space between services title and text
            Text(
              '1. Custom Duty Processing\n'
              '2. Logistics Management\n'
              '3. Supply Chain Solutions',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
                height: 20), // Space between services and contact info
            Text(
              'Contact Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Space between contact title and text
            Text(
              'Phone: +234 123 456 7890\n'
              'Email: contact@yourcompany.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
