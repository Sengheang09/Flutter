import 'dart:convert';
import 'package:final_project/models/movie_mode.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/constants/api_constants.dart';
class TmdbService {
  Future<List<MovieModel>> fetchPopularMovies() async {
    final url =
        '${ApiConstants.baseUrl}/movie/popular?api_key=${ApiConstants.apiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['results'];
      return results.map((j) => MovieModel.fromJson(j)).toList();
    }
    throw Exception('Failed to load popular movies');
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    if (query.trim().isEmpty) return [];
    final safeQuery = Uri.encodeQueryComponent(query);
    final url =
        '${ApiConstants.baseUrl}/search/movie?api_key=${ApiConstants.apiKey}&query=$safeQuery';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['results'];
      return results.map((j) => MovieModel.fromJson(j)).toList();
    }
    throw Exception(
        'Search failed: ${response.statusCode} ${response.reasonPhrase}');
  }
}
