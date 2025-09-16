import 'package:final_project/Views/screen_download.dart';
import 'package:final_project/Views/search/btn_search.dart';
import 'package:final_project/Views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Views/home/homescreen.dart';
import 'package:final_project/const/themes/app_themes.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    BtnSearchScreen(),
    ScreenDownload(),
    Profile(),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {'icon': 'assets/icons/home.png', 'label': 'Home'},
    {'icon': 'assets/icons/search.png', 'label': 'Search'},
    {'icon': 'assets/icons/icon_download.png', 'label': 'Download'},
    {'icon': 'assets/icons/profile.png', 'label': 'Profile'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: AppThemeData.primary_dark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            return _buildNavItem(
              _navItems[index]['icon'],
              _navItems[index]['label'],
              index,
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        height: 50,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppThemeData.primary_blue.withOpacity(0.2)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
              color:
                  isSelected
                      ? AppThemeData.primary_blue
                      : AppThemeData.text_color_white,
            ),
            const SizedBox(width: 10),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child:
                  isSelected
                      ? Text(
                        label,
                        style: TextStyle(
                          color: AppThemeData.primary_blue,
                          fontSize: 12,
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
