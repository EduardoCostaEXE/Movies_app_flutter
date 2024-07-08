import 'package:dio/dio.dart';
import 'models/movie.dart';

class MovieApi {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
  );

  final String apiKey = '42c9e433f49c9956a59378574f5ef333';

  Future<List<Movie>> getMovies() async {
    var response = await _dio
      .get('/movie/popular', queryParameters: {
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

  Future<List<Genre>> getGenres() async {
    var response = await _dio.get('/genre/movie/list', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR',
    });

    return (response.data['genres'] as List)
      .map((item) => Genre.fromJson(item))
      .toList();
  }

  //Tela de detalhes
  Future<Movie> getMovie(int movieId) async {
    var response = await _dio.get('/movie/$movieId', queryParameters: {
      'api_key': apiKey,
      'language': 'pt-BR',
    });

    return Movie.fromJson(response.data);
  }
}