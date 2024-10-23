import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How can we help you? '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactOptions(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Review'),
            const SizedBox(height: 10),
            _buildReviewText(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'FAQ'),
            const SizedBox(height: 10),
            _buildFAQText(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOptions() {
    return Wrap(
      spacing: 30.0,
      alignment: WrapAlignment.center,
      children: [
        _buildContactOption(
          icon: Icons.phone,
          label: 'Call Us',
          onPressed: () async {
            final Uri _url = Uri.parse('tel:+23490 3125 5504');

            if (!await launchUrl(_url)) {
              throw Exception('Could not launch $_url');
            }
          },
        ),
        _buildContactOption(
          icon: Icons.email,
          label: 'Email Us',
          onPressed: () async {
            final Uri _emailUrl = Uri(
              scheme: 'mailto',
              path:
                  'documentation@cfcterminal.com', // Replace with the recipient's email
              query:
                  'subject=&body=How are you?', // Optional: Prefill subject and body
            );

            if (!await launchUrl(_emailUrl,
                mode: LaunchMode.externalApplication)) {
              throw Exception('Could not launch $_emailUrl');
            }
          },
        ),
        _buildContactOption(
          icon: Icons.chat,
          label: 'WhatsApp',
          onPressed: () async {
            final Uri _whatsappUrl = Uri.parse('https://wa.me/2347030949532');

            if (!await launchUrl(_whatsappUrl,
                mode: LaunchMode.externalApplication)) {
              throw Exception('Could not launch $_whatsappUrl');
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        border: Border.all(color: Colors.black38), // Softer border color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2), // Changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0), // Padding inside the container
      child: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: CircleBorder(), // Circular shape
              backgroundColor: Colors.transparent, // Transparent background
            ),
            onPressed: onPressed,
            child: Icon(icon,
                size: 30,
                color: Colors.red), // Icon color matches primary color
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22, // Increased font size
          ),
    );
  }

  Widget _buildReviewText() {
    return Text(
      'We would love to hear your thoughts about our app! Please leave a review to help us improve.',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildFAQText() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        border: Border.all(color: Colors.black38), // Softer border color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2), // Changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('FAQ:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            '1. How do I reset my password?\n'
            '2. Where can I find my transaction history?\n'
            '3. How do I contact customer support?\n'
            '4. What should I do if I encounter an error?\n'
            '5. How do I change my account settings?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
