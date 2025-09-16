import 'package:final_project/Views/home/most_popular_movie_slider.dart';
import 'package:final_project/controllers/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:final_project/models/movie_mode.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieViewModel(),
      child: Scaffold(
        backgroundColor: AppThemeData.primary_dark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.white),
          title: Text(
            movie.title,
            style: const TextStyle(
              color: AppThemeData.text_color_white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: const [
            Icon(Icons.favorite_border, color: Colors.white),
            SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie.fullImageUrl,
                  height: 340,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: AppThemeData.text_color_grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    movie.releaseDate.isNotEmpty
                        ? movie.releaseDate.split("-")[0]
                        : "N/A",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.timer,
                    size: 14,
                    color: AppThemeData.text_color_grey,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "148 Minutes",
                    style: TextStyle(color: AppThemeData.text_color_grey),
                  ),

                  const SizedBox(width: 16),
                  const Icon(
                    Icons.category,
                    size: 14,
                    color: AppThemeData.text_color_grey,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Action",
                    style: TextStyle(color: AppThemeData.text_color_grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 6),
                  Text(
                    "4.5",
                    style: TextStyle(color: AppThemeData.text_color_white),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Play & Download Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemeData.secondary_orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Play"),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(
                      Icons.download_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.link, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Story Line
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Story Line",
                  style: TextStyle(
                    color: AppThemeData.text_color_white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero’s identity is revealed...",
                style: TextStyle(color: AppThemeData.text_color_white_grey),
              ),

              const SizedBox(height: 24),

              // Cast and Crew
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "More",
                  style: TextStyle(
                    color: AppThemeData.text_color_white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // You can add a horizontal scroll list of cast images here
              MostPopularSection(),
            ],
          ),
        ),
      ),
    );
  }
}
