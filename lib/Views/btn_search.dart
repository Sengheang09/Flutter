import 'package:final_project/Views/categoryselect.dart';
import 'package:final_project/Views/search.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:flutter/material.dart';

class BtnSearchScreen extends StatelessWidget {
  const BtnSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            CategorySelector(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Today",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppThemeData.text_color_white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
