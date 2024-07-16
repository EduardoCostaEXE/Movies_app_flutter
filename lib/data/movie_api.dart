import 'package:dio/dio.dart';
import 'models/movie.dart';

class MovieApi {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
  );

  final String apiKey = 'apiKey';

  Future<List<Movie>> getMovies() async {
    var response = await _dio.get('/movie/popular', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR',
      'page': 1,
    });

    return (response.data['results'] as List)
      .map((item) => Movie.fromJson(item))
      .toList();
  }

  Future<List<Movie>> getMoviesByGenre(int genreId) async {
    var response = await _dio.get('/discover/movie', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR',
      'sort_by': 'popularity.desc',
      'with_genres': genreId,
    });

    return (response.data['results'] as List)
      .map((item) => Movie.fromJson(item))
      .toList();
  }

  Future<Map<int, String>> getGenresInMovie() async {
    final response = await _dio.get('/genre/movie/list', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR'
    });

    final List<dynamic> genres = response.data['genres'];
    return {for (var genre in genres) genre['id']: genre['name']};
  }

  Future<List<Genre>> getGenres() async {
    final response = await _dio.get('/genre/movie/list', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR'
    });

    if (response.statusCode == 200) {
      var data = response.data;
      List<Genre> genres = (data['genres'] as List).map((item) => Genre.fromJson(item)).toList();
      return genres;
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<Movie> getMovie(int movieId) async {
    var response = await _dio.get('/movie/$movieId', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR',
    });

    return Movie.fromJson(response.data);
  }
}