import 'dart:async';
import 'package:movies_app_flutter/data/movie_api.dart';
import 'package:movies_app_flutter/service_locator.dart';
import '../../data/models/movie.dart';

class MovieListController {
  final api = getIt<MovieApi>();

  final _moviesController = StreamController<List<Movie>>();
  final _genresController = StreamController<List<Genre>>();

  Stream<List<Movie>> get moviesStream => _moviesController.stream;
  Stream<List<Genre>> get genresStream => _genresController.stream;

  void init() {
    fetchMovies();
    fetchGenres();
  }

  Future<void> fetchMovies() async {
    var result = await api.getMovies();
    _moviesController.sink.add(result);
  }

  Future<void> fetchGenres() async {
    var result = await api.getGenres();
    _genresController.sink.add(result);
  }

  void dispose() {
    _moviesController.close();
    _genresController.close();
  }
}