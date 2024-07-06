import 'package:dio/dio.dart';
import 'models/movie.dart';

class MovieApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': '42c9e433f49c9956a59378574f5ef333',
        'language': 'pt-BR',
      },
    ),
  );

  Future<List<Movie>> getMovies({int page = 1}) async {
    var response = await _dio.get('/movie/popular', queryParameters: {'page': page});

    return (response.data['results'] as List)
        .map((item) => Movie.fromJson(item))
        .toList();
  }
}