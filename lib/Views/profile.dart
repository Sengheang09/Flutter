import 'package:final_project/const/themes/app_themes.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,

      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    color: AppThemeData.text_color_white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),

                Container(
                  width: 380,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_darkgrey,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/image/My.png",
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text(
                              "Chea Taa",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: AppThemeData.text_color_white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "cheataa369@gmail.com",
                            style: TextStyle(
                              color: AppThemeData.text_color_grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),
                      Image.asset("assets/icon/Combined-Shape.png"),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  width: 380,
                  height: 120,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    "assets/image/Banner.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 380,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_grey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 380,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_grey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 380,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
