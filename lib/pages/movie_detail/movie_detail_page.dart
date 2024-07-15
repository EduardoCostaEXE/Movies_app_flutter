import 'package:flutter/material.dart';
import 'package:movies_app_flutter/pages/movie_detail/widgets/movie_detail_about_widget.dart';
import 'package:movies_app_flutter/pages/movie_detail/widgets/movie_detail_cover_widget.dart';
import 'package:movies_app_flutter/service_locator.dart';
import '../../data/models/movie.dart';
import '../movie_list/widgets/progress_indicator_widget.dart';
import 'movie_detail_controller.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late final MovieDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<MovieDetailController>();
    controller.init(widget.movie);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Movie>(
        initialData: widget.movie,
        stream: controller.movieStream,
        builder: (context, genresSnapshot) {
          var movie = genresSnapshot.data!;
          if (genresSnapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorWidget();
          }
          return CustomScrollView(
            slivers: [
              MovieDetailCoverWidget(movie: movie),
              MovieDetailAboutWidget(movie: movie, controller: controller),
            ],
          );
        },
      ),
    );
  }
}