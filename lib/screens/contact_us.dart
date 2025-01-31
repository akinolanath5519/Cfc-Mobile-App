import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      final Uri _url = Uri.parse('tel:+23490 3125 5504');

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
                          Uri.parse('https://wa.me/+2347083237953');

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
              const SizedBox(
                  height: 10), // Space between services title and text
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
              const SizedBox(
                  height: 10), // Space between contact title and text
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Phone: +23490 3125 5504\n',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Email: documentation@cfcterminal.com\n',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Website: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                        text:
                            'www.cfcterminal.com', // Website address (can be a variable)
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors
                              .blue, // Make the website text blue (or any desired color)
                          decoration: TextDecoration
                              .underline, // Underline for visual cue
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final Uri _url =
                                Uri.parse('https://www.cfcterminal.com');

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          } // Launch website on tap
                        ),
                    TextSpan(
                      text:
                          '\nAddress: CFC Office HQ, 4 Ilorin Street, Surulere, Lagos State, Nigeria\n'
                          '\nBusiness Hours: Monday - Friday: 9:00 AM - 5:00 PM (WAT Time)\n'
                          '\nIMPORTANT PROFESSIONAL TRAINING OPPORTUNITY!!!Unlock Your Career Potential with Our Clearing and Forwarding Training!\n'
                          """Are you looking to break into the clearing and forwarding industry? We offer professional training to equip you with the skills needed to thrive. Learn the essentials of customs procedures, documentation, logistics management, and more. Whether you're new to the field or looking to enhance your expertise, our comprehensive program is tailored to help you succeed in this dynamic industry.
"""
                          """\nJoin us today and become a certified expert in clearing and forwarding!\n
"""
                          """For inquiries, contact us now!""",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
