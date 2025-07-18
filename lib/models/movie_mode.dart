class MovieModel {
  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'] ?? '',
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        voteAverage: (json['vote_average'] ?? 0).toDouble(),
      );

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}
