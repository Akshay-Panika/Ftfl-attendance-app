import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../screen_view/attendance_screen.dart';
import '../screen_view/home_screen.dart';
import '../screen_view/profile_screen.dart';

class BuildBottomNav extends StatefulWidget {
  BuildBottomNav({super.key});

  @override
  _BuildBottomNavState createState() => _BuildBottomNavState();
}

class _BuildBottomNavState extends State<BuildBottomNav> {
  int _currentIndex = 0; // Default to AttendanceScreen
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    HomeScreen(),
    AttendanceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: BottomNavyBar(
          backgroundColor: Colors.green.shade900,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.black12,
          //showInactiveTitle: true,
          itemCornerRadius: 15,

          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavyBarItem(
              title: const Text('Home'),
              icon: const Icon(Icons.home),
              activeColor: Colors.white,

            ),

            BottomNavyBarItem(
              title: const Text('Attendance'),
              icon: const Icon(Icons.calendar_month),
              activeColor: Colors.white,
            ),

            BottomNavyBarItem(
              title: const Text('Profile'),
              icon: const Icon(Icons.person),
              activeColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
