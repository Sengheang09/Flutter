import 'package:final_project/models/movie_mode.dart';
import 'package:flutter/material.dart';
import 'package:final_project/services/tmdb_service.dart';

class MovieViewModel extends ChangeNotifier {
  final TmdbService _svc = TmdbService();

  List<MovieModel> _movies = [];
  bool _isLoading = false;
  String? _error;

  List<MovieModel> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPopularMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      _movies = await _svc.fetchPopularMovies();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  // --- expose search for the Search screen
  Future<List<MovieModel>> searchMovies(String q) => _svc.searchMovies(q);
}
