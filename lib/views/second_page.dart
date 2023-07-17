import 'package:flutter/material.dart';
import 'package:untitled1/views/bottom_sheet_pages/settings_screen.dart';
import 'bottom_sheet_pages/main_screen.dart';
import 'bottom_sheet_pages/profile_screen.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const MainScreen(),
    const ProfileScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        unselectedItemColor: Colors.lightBlue[400],
        selectedItemColor: Colors.blue[900],
      ),
    );
  }
}
