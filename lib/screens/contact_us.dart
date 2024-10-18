import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  onPressed: () async {
                    // Add your call functionality here
                    final Uri _url = Uri.parse('tel:0903125533504');

                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
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
                  onPressed: () async {
                    // Add your WhatsApp functionality here
                    final Uri _whatsappUrl =
                        Uri.parse('https://wa.me/2347030949532');

                    if (!await launchUrl(_whatsappUrl,
                        mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $_whatsappUrl');
                    }
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
              'Phone: +234 903125533504\n'
              'Email: cdocumentation@cfcterminal.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
