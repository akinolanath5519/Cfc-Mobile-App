import 'package:cfc/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class ProfilePage extends GetView<AuthController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Add SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Map<String, dynamic>?>(
            future: controller.getUserProfileFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text(""); // Placeholder while loading
              }

              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("No user data found.");
              }

              // Extract first name and last name from the snapshot data
              final firstName = snapshot.data!["first_name"] ?? "User";
              final lastName = snapshot.data!["last_name"] ?? "";
              final email = snapshot.data!["email"] ?? "";
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile picture
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                          'assets/images/profile.jpg'), // Replace with your profile image
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // User name
                  Center(
                    child: Text(
                      '$firstName $lastName', // Replace with dynamic data
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email
                  Center(
                    child: Text(
                      '$email', // Replace with dynamic data
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Your Account Section
                  _buildSectionTitle(context, 'Your Account'),
                  _buildActionButton(
                    icon: Icons.person,
                    label: 'Edit Profile',
                    onPressed: () {
                      // Navigate to EditProfilePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // App Settings Section
                  _buildSectionTitle(context, 'App Settings'),
                  _buildActionButton(
                    icon: Icons.support,
                    label: 'Support',
                    onPressed: () {
                      // Handle support action
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildActionButton(
                    icon: Icons.policy,
                    label: 'Terms & Services',
                    onPressed: () {
                      // Handle terms and services action
                    },
                  ),
                  const SizedBox(height: 16),

                  // Log Out Button
                  _buildActionButton(
                    icon: Icons.logout,
                    label: 'Log Out',
                    onPressed: () {
                      controller.logout();
                    },
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0), // Padding for left alignment
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded button
          ),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between icon/text and ">" icon
          children: [
            // Main button content
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16), // Space between icon and text
                Text(label, textAlign: TextAlign.left),
              ],
            ),
            // ">" Button inside
            Icon(Icons.arrow_forward, color: textColor), // Greater than icon
          ],
        ),
      ),
    );
  }
}
