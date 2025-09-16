import 'package:final_project/Views/categoryselect.dart';
import 'package:final_project/Views/home/most_popular_movie_slider.dart';
import 'package:final_project/Views/search/search.dart';
import 'package:final_project/Views/search/search_screen.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:final_project/controllers/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtnSearchScreen extends StatelessWidget {
  const BtnSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieViewModel()..fetchPopularMovies(),
      child: Scaffold(
        backgroundColor: AppThemeData.primary_dark,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Search Bar
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

                /// Category Selector
                const CategorySelector(),
                const SizedBox(height: 20),

                /// Today Section Title
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppThemeData.text_color_white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                /// Today Movie Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 30,
                  ),
                  child: Consumer<MovieViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (viewModel.error != null) {
                        return Center(child: Text("Error: ${viewModel.error}"));
                      }

                      final movies = viewModel.movies;
                      if (movies.isEmpty) {
                        return const Center(child: Text("No movies found"));
                      }

                      // ✅ Show the first movie
                      final movie = movies.first;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Poster
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppThemeData.text_color_white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                movie.fullImageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    size: 100,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          /// Movie Info
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Premium Tag
                                  Container(
                                    width: 90,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppThemeData.secondary_orange,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Premium",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppThemeData.text_color_white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  /// Title
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      color: AppThemeData.text_color_white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 16),

                                  /// Year
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/day.png",
                                        height: 16,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        movie.releaseDate.isNotEmpty
                                            ? movie.releaseDate.split("-")[0]
                                            : "N/A",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppThemeData.text_color_grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 16),

                                  /// Runtime + PG
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/time.png",
                                        height: 16,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        // movie.runtime != null
                                        //     ? "${movie.runtime} Minutes"
                                        //     : "Unknown",
                                        "158 Minutes",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppThemeData.text_color_grey,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        width: 45,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          border: Border.all(
                                            strokeAlign: 1,
                                            color: AppThemeData.primary_blue,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "PG-13",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppThemeData.primary_blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 16),

                                  /// Genre + Type
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/action.png",
                                        height: 16,
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Action | ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppThemeData.text_color_grey,
                                        ),
                                      ),
                                      const Text(
                                        "Movie",
                                        style: TextStyle(
                                          color: AppThemeData.text_color_white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// Recommended Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text(
                        "Recommend for you",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: AppThemeData.text_color_white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: AppThemeData.primary_blue,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Popular Movies Slider
                const MostPopularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
