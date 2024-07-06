import 'dart:async';
import 'package:movies_app_flutter/data/movie_api.dart';
import 'package:movies_app_flutter/service_locator.dart';
import '../../data/models/movie.dart';

class MovieListController{
  final api = getIt<MovieApi>();

  final _controller = StreamController<List<Movie>>();
  Stream<List<Movie>>get stream => _controller.stream;

  void init(){
    getMovies();
  }

  Future<void> getMovies() async{
    var result = await api.getMovies();

    _controller.sink.add(result);
  }
}