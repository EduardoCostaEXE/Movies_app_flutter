import 'package:flutter/material.dart';
import 'package:movies_app_flutter/pages/movie_detail/movie_detail_controller.dart';
import '../../../data/models/movie.dart';

class MovieDetailAboutWidget extends StatelessWidget {
  const MovieDetailAboutWidget({super.key, required this.movie, required this.controller});

  final Movie movie;
  final MovieDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: _buildIcon(Icons.calendar_month_outlined),
                ),
                Text('Lançamento: ${movie.formattedReleaseDate}'),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: _buildIcon(Icons.category),
                ),
                StreamBuilder<List<String>>(
                  stream: controller.genresStream,
                  builder: (context, snapshot) {
                    var genres = snapshot.data ?? [];
                    return Text('Gêneros: ${genres.join(', ')}');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Sinopse:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              movie.overview,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Icon _buildIcon(IconData iconData) => Icon(iconData, color: Colors.amber, size: 16);
}