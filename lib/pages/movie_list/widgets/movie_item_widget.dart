import 'package:flutter/material.dart';
import '../../../data/models/movie.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
              width: 120,
              height: 154,
            ),
          ),
        ),
        const SizedBox(width: 4.0),
        Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0),
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Text('Release: ${movie.releaseDate}'),
                  ],
                ),
                Text(movie.overview),
              ],
            )
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }
}