import 'package:flutter/material.dart';
import 'package:movies_app_flutter/pages/movie_list/widgets/genre_section_widget.dart';
import 'package:movies_app_flutter/pages/movie_list/widgets/progress_indicator_widget.dart';
import 'package:movies_app_flutter/service_locator.dart';
import '../../data/models/movie.dart';
import 'movie_detail_controller.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final controller = getIt.registerSingleton(MovieDetailController());

  @override
  void initState() {
    controller.init(widget.movie);
    super.initState();
  }

  @override
  void dispose() {
    getIt.unregister(instance: controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var movie = widget.movie;

    return Scaffold(
      body: StreamBuilder<Movie>(
        initialData: widget.movie,
        stream: controller.stream,
        builder: (context, genresSnapshot) {
          var movie = genresSnapshot.data!;
          // if (genresSnapshot.connectionState == ConnectionState.waiting) {
          //   return const ProgressIndicatorWidget();
          // }
          return Text(movie.title);
        },
      ),
    );
  }
}