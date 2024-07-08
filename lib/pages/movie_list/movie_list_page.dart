import 'package:flutter/material.dart';
import 'package:movies_app_flutter/pages/movie_list/movie_list_controller.dart';
import 'package:movies_app_flutter/pages/movie_list/widgets/genre_section_widget.dart';
import 'package:movies_app_flutter/pages/movie_list/widgets/progress_indicator_widget.dart';
import 'package:movies_app_flutter/service_locator.dart';
import '../../data/models/movie.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final controller = getIt<MovieListController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search)
          )
        ],
      ),
      body: StreamBuilder<List<Genre>>(
        stream: controller.genresStream,
        builder: (context, genresSnapshot) {
          if (genresSnapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorWidget();
          }

          var genres = genresSnapshot.data!;

          return StreamBuilder<List<Movie>>(
            stream: controller.moviesStream,
            builder: (context, moviesSnapshot) {
              if (moviesSnapshot.connectionState == ConnectionState.waiting) {
                return const ProgressIndicatorWidget();
              }

              if (!moviesSnapshot.hasData || moviesSnapshot.data!.isEmpty) {
                return const Center(child: Text('No movies available'));
              }

              var movies = moviesSnapshot.data!;

              return ListView.builder(
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  var genre = genres[index];
                  var genreMovies = movies.where((m) => m.genreIds.contains(genre.id)).toList();
                  return GenreSectionWidget(genre: genre.name, movies: genreMovies);
                },
              );
            },
          );
        },
      ),
    );
  }
}