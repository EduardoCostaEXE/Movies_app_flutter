import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/movie.dart';

class MovieDetailAboutWidget extends StatelessWidget {
  const MovieDetailAboutWidget({super.key, required this.movie});

  final Movie movie;

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
                Text('Lançamento: ${movie.releaseDate}'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                  child: _buildIcon(Icons.category),
                ),
                Text('Generos'),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Sinopse:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
                movie.overview,
                textAlign: TextAlign.justify
            )
          ],
        ),
      ),
    );
  }
  Icon _buildIcon(IconData iconData) => Icon(iconData, color: Colors.amber, size: 16);
}
