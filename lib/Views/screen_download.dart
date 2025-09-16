import 'package:final_project/const/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Download",
                    style: TextStyle(
                      color: AppThemeData.text_color_white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  children: [
                    Image.asset("assets/icons/no_movie.png"),
                    SizedBox(height: 25),
                    Text(
                      "There Is No Movie Yet!",
                      style: TextStyle(
                        color: AppThemeData.text_color_white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Find your movie by Type title, \n\t\t\t\t\tcategories, years, etc",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppThemeData.text_color_grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
