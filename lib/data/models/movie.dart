import 'package:intl/intl.dart';

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.genreIds,
    required this.posterPath,
  });

  final int id;
  final String title;
  final DateTime releaseDate;
  final String overview;
  final List<int>? genreIds;
  final String posterPath;

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w500$posterPath';

  String get formattedReleaseDate => DateFormat('dd/MM/yyyy').format(releaseDate);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      releaseDate: DateTime.parse(json['release_date']),
      overview: json['overview'],
      genreIds: List<int>.from(json['genre_ids']),
      posterPath: json['poster_path'],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}