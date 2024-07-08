import 'package:flutter/material.dart';
import 'package:movies_app_flutter/pages/movie_detail/movie_detail_page.dart';
import '../../../data/models/movie.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            movie.fullImageUrl,
            fit: BoxFit.cover,
            width: 120,
            height: 180,
          ),
        ),
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MovieDetailPage(movie: movie),
            )
        );
      },
    );
  }
}