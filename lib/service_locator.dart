import 'package:get_it/get_it.dart';
import 'package:movies_app_flutter/data/movie_api.dart';
import 'package:movies_app_flutter/pages/movie_list/movie_list_controller.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<MovieApi>(() => MovieApi());
  getIt.registerLazySingleton<MovieListController>(() => MovieListController());
}