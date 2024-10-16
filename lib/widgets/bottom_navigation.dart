import 'package:cfc/screens/home.dart';
import 'package:cfc/screens/policy.dart';
import 'package:cfc/screens/profile.dart';
import 'package:cfc/screens/support.dart';
import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  int _selectedIndex = 0;

  // List of pages corresponding to each tab
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ProfilePage(),
    SupportPage(),
    PolicyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeSection(),
          Expanded(
              child:
                  _pages[_selectedIndex]), // Display the selected tab's content
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Builds the AppBar with a gradient background.
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: SafeArea(
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFED0006), // #ED0006
                  Color.fromRGBO(52, 0, 206, 0.76), // rgba(52, 0, 206, 0.76)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the section for the welcome message and image.
  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(child: _buildWelcomeText()),
          const SizedBox(width: 130), // Space between text and image
          _buildWelcomeImage(),
        ],
      ),
    );
  }

  /// Builds the welcome text with a RichText widget.
  Widget _buildWelcomeText() {
    return RichText(
      text: TextSpan(
        children: const [
          TextSpan(
            text: 'Welcome,\n',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'SEGUN WILLIAMS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the welcome image.
  Widget _buildWelcomeImage() {
    return Image.asset(
      'assets/images/cfc.jpg',
      width: 72,
      height: 58,
    );
  }

  /// Builds the Bottom Navigation Bar with items.
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.support), label: 'Support'),
        BottomNavigationBarItem(icon: Icon(Icons.policy), label: 'Policy'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 226, 57, 41),
      unselectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }

  /// Updates the selected index when a Bottom Navigation Bar item is tapped.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
