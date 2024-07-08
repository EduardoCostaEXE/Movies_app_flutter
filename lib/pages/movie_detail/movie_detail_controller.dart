import 'dart:async';
import 'package:movies_app_flutter/data/movie_api.dart';
import 'package:movies_app_flutter/service_locator.dart';
import '../../data/models/movie.dart';

class MovieDetailController {
  final api = getIt<MovieApi>();
  late Movie _movie;

  final _controller = StreamController<Movie>();
  Stream<Movie> get stream => _controller.stream;

  void init(Movie movie) {
    _movie= movie;

    getMovie();
  }

  Future<void> getMovie() async {
    var result = await api.getMovie(_movie.id);
    _controller.sink.add(result);
  }
}