import 'package:flutter/material.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // Declare the TabController

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Initialize the TabController
  }

  @override
  void dispose() {
    _tabController
        .dispose(); // Dispose the TabController when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy'),
        bottom: TabBar(
          controller: _tabController, // Use the initialized TabController
          tabs: const [
            Tab(text: 'Terms & Conditions'),
            Tab(text: 'Privacy Policy'),
          ],
          labelColor: Colors.black, // Set the selected tab text color to black
          unselectedLabelColor:
              Colors.black, // Set the unselected tab text color to black
          indicatorColor:
              Colors.red, // Set the selected tab indicator color to red
          indicatorWeight: 3.0, // Optional: Set the thickness of the indicator
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Use the initialized TabController
        children: const [
          _TermsAndConditions(),
          _PrivacyPolicy(),
        ],
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terms & Conditions',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          // Add the terms and conditions text/content here
          Text(
            """
Welcome to CFC Freight App! By accessing or using our app, you agree to comply with and be bound by the following terms and conditions. Please read these terms carefully before using our app.

1. Acceptance of Terms: By accessing or using our app, you agree to these Terms of Use and our Privacy Policy. If you do not agree with any part of these terms, you may not access or use our app.

2. Use of the App: You may use our app for lawful purposes only and in accordance with these Terms of Use. You agree not to use our app for any illegal or unauthorized purpose.

3. Account Registration: Some features of our app may require you to register for an account. When registering for an account, you agree to provide accurate, current, and complete information.

4. Intellectual Property Rights: All content and materials available on our app, including but not limited to text, graphics, logos, button icons, images, audio clips, and software, are the property of CFC or its licensors and are protected by copyright, trademark, and other intellectual property laws.

5. User Conduct: You agree not to engage in any conduct that could damage, disable, or impair the functionality of our app or interfere with any other party's use of our app. You also agree not to use our app to harass, abuse, defame, or otherwise violate the legal rights of others.

6. Limitation of Liability: In no event shall CFC, its affiliates, or their respective officers, directors, employees, or agents be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of our app.

7. Modifications to Terms: We reserve the right to modify these Terms of Use at any time without prior notice. Your continued use of our app after any modifications to these terms will constitute your acceptance of such changes.

8. Governing Law: These Terms of Use shall be governed by and construed in accordance with the laws of Nigeria, without regard to its conflict of law provisions.
""",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _PrivacyPolicy extends StatelessWidget {
  const _PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          // Add the privacy policy text/content here
          Text(
            """
CFC Freight App, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our app. By using our app, you agree to the practices described in this policy.

1. Information We Collect  
We may collect the following types of information:  
- **Personal Information:** Name, email address, phone number, and other contact details provided during registration or while using our services.  
- **Usage Data:** Information about how you use our app, including access times, pages viewed, and other actions taken within the app.  
- **Device Information:** Information about the device you use to access our app, such as IP address, operating system, and browser type.  
- **Location Data:** If you allow location services, we may collect and process your location information to enhance your user experience.

2. How We Use Your Information  
We use the information we collect for the following purposes:  
- To provide and maintain our services.  
- To improve the functionality and user experience of the app.  
- To communicate with you about updates, promotions, and relevant service information.  
- To prevent fraud, monitor suspicious activities, and enforce our Terms of Use.  
- To comply with legal obligations and resolve disputes.

3. Sharing Your Information  
We do not sell or rent your personal information to third parties. However, we may share your data in the following circumstances:  
Service Providers: With trusted third-party vendors who assist us in operating our app and delivering services.  
Legal Requirements: If required by law or if we believe that such disclosure is necessary to protect our rights or comply with legal obligations.  
Business Transfers: If our company merges, acquires, or transfers assets, your information may be part of the transferred assets.

4. Data Security  
We implement appropriate technical and organizational measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no method of data transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.

5. User Rights and Control  
You have the right to:  
Access and Update: View and update your personal information through your account settings.\n  
Delete Your Data: Request the deletion of your personal information, subject to legal obligations.  
Withdraw Consent: Disable location tracking or unsubscribe from communications at any time.

6. Cookies and Tracking Technologies  
Our app may use cookies and similar tracking technologies to enhance your experience. You can control cookies through your device settings, but disabling them may affect certain functionalities.

7. Third-Party Links  
Our app may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these third parties. We encourage you to read their privacy policies before sharing your information.

8. Children's Privacy  
Our app is not intended for children under the age of 13. We do not knowingly collect personal information from children. If we learn that a child’s information has been collected, we will delete it promptly.

9. Changes to This Privacy Policy  
We reserve the right to modify this Privacy Policy at any time. Any changes will be effective immediately upon posting the updated policy within the app. Your continued use of the app after such changes will signify your acceptance of the new policy.

10. Contact Us  
If you have any questions or concerns about this Privacy Policy, please contact us at:  
Email: documentation@cfcterminal.com  
Phone: +234903125533504  

""",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
