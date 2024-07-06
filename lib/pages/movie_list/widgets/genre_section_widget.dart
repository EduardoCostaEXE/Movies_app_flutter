import 'package:flutter/material.dart';
import '../../../data/models/movie.dart';
import 'movie_item_widget.dart';

class GenreSectionWidget extends StatelessWidget {
  final String genre;
  final List<Movie> movies;

  const GenreSectionWidget({
    super.key,
    required this.genre,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            genre,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieItemWidget(movie: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}