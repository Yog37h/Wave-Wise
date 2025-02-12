import 'package:flutter/material.dart';
import 'package:ww1/screen/screen_one.dart';
import 'package:ww1/screen/screen_two.dart';
import 'package:ww1/screen/screen_three.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.blue.shade800,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? _buildGlowingIcon(Icons.home)
                : const Icon(Icons.home),
            label: 'Hubs',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? _buildGlowingIcon(Icons.search)
                : const Icon(Icons.search),
            label: 'Track your boat',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? _buildGlowingIcon(Icons.monetization_on)
                : const Icon(Icons.monetization_on),
            label: 'Profit',
          ),
        ],
      ),
    );
  }

  // Function to create a glowing icon for the selected tab
  Widget _buildGlowingIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
