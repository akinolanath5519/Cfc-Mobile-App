import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedRole;
  File? _profileImage; // Variable to hold the selected image

  final List<String> _roles = ['Admin', 'User', 'Manager']; // Add more roles as needed
  final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveChanges, // Save changes action
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Center(
              child: GestureDetector(
                onTap: _selectImage, // Call the image selection method on tap
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _profileImage != null // Show the selected image if available
                      ? FileImage(_profileImage!) as ImageProvider // Explicitly cast to ImageProvider
                      : const AssetImage('assets/images/profile.jpg') as ImageProvider, // Explicitly cast to ImageProvider
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Full Name Field
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Role Dropdown
            DropdownButtonFormField<String>(
              value: _selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue;
                });
              },
              items: _roles.map<DropdownMenuItem<String>>((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Your Role',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please select your role';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Short Description Field
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Short Description',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a short description';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Save Changes Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white, // Set button color to red
                  ),
                  onPressed: _saveChanges,
                  child: const Text('Save Changes'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to select an image from the gallery or take a photo
  Future<void> _selectImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // Update the profile image variable
      });
    }
  }

  void _saveChanges() {
    if (_fullNameController.text.isEmpty || _selectedRole == null || _descriptionController.text.isEmpty) {
      // Show an error message if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Handle save changes logic
    String fullName = _fullNameController.text;
    String description = _descriptionController.text;

    // Provide feedback after saving
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile Updated\nFull Name: $fullName\nRole: $_selectedRole\nDescription: $description'),
      ),
    );
  }
}
