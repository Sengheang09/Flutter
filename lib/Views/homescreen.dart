import 'package:final_project/Views/categoryselect.dart';
import 'package:final_project/Views/movie_auto_slider.dart';
import 'package:final_project/Views/most_popular_movie_slider.dart';
import 'package:final_project/Views/search.dart';
import 'package:final_project/controllers/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieViewModel(),
      child: Scaffold(
        backgroundColor: AppThemeData.primary_dark,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                // AppBar replaced with custom widget
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/image/My.png'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Chea Taa',
                            style: TextStyle(
                              color: AppThemeData.text_color_white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Let’s stream your favorite movie',
                            style: TextStyle(
                              color: AppThemeData.text_color_grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppThemeData.primary_soft,
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: AppThemeData.secondary_red,
                        ),
                      ),
                    ],
                  ),
                ),
                const Search(),
                const MovieSlider(),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppThemeData.text_color_white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const CategorySelector(),
                SizedBox(height: 10),
                const MostPopularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
