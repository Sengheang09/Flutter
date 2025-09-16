import 'package:final_project/Views/categoryselect.dart';
import 'package:final_project/Views/home/movie_auto_slider.dart';
import 'package:final_project/Views/home/most_popular_movie_slider.dart';
import 'package:final_project/Views/search/search.dart';
import 'package:final_project/Views/search/search_screen.dart';
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
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/f0/b6/ea/f0b6ea6cdb83304ab03251a620116c44.jpg",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Heang',
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ChangeNotifierProvider.value(
                              value: Provider.of<MovieViewModel>(
                                context,
                                listen: false,
                              ),
                              child: const SearchScreen(),
                            ),
                      ),
                    );
                  },
                  child: const Search(),
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Most Popular',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppThemeData.text_color_white,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppThemeData.primary_blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const MostPopularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
