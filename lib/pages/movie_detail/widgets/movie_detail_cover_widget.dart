import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/movie.dart';

class MovieDetailCoverWidget extends StatelessWidget {
  const MovieDetailCoverWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie.fullImageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end:  FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xFF15173D).withOpacity(0.4),
                      Color(0xFF15173D).withOpacity(1.0),
                    ],
                  stops: [0.5, 1.0]
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16.0, bottom: 16.0),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 1.0, end: 0.0),
                  duration: const Duration(milliseconds: 500),
                  builder: (BuildContext context, double value, Widget? child){
                    return Transform.scale(
                      scale: 1 + value,
                      child: Opacity(
                        opacity: 1 - value,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
