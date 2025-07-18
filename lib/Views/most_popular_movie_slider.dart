import 'package:final_project/Views/movie_detail_screen.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:final_project/controllers/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/models/movie_mode.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.error != null) {
          return Center(child: Text('Error: ${viewModel.error}'));
        }

        final movies = viewModel.movies;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & See All
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
            const SizedBox(height: 12),

            // Horizontal list of movies
            Container(
              height: 240,
              // color: AppThemeData.primary_soft,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final MovieModel movie = movies[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailScreen(movie: movie),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        width: 165,
                        child: Container(
                          width: 165,
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppThemeData.primary_soft,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Poster
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  movie.fullImageUrl,
                                  height: 180,
                                  width: 165,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 6),

                              // Title
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  movie.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppThemeData.text_color_white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
