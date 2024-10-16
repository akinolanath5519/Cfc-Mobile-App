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
    _tabController = TabController(length: 2, vsync: this); // Initialize the TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController when the widget is removed
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
          unselectedLabelColor: Colors.black, // Set the unselected tab text color to black
          indicatorColor: Colors.red, // Set the selected tab indicator color to red
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
            '1. Introduction\n'
            'These terms and conditions govern your use of our application.\n\n'
            '2. User Obligations\n'
            'You agree to use the app only for lawful purposes...\n\n'
            '3. Limitation of Liability\n'
            'Our liability is limited to the maximum extent permitted by law...',
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
            '1. Information Collection\n'
            'We collect personal information when you use our app...\n\n'
            '2. Information Usage\n'
            'Your information may be used to improve our services...\n\n'
            '3. Data Protection\n'
            'We take appropriate measures to protect your data...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
