import 'package:rxdart/rxdart.dart';
import '../../data/models/movie.dart';
import '../../data/movie_api.dart';
import '../../service_locator.dart';

class MovieDetailController {
  final _movieSubject = BehaviorSubject<Movie>();
  final _genresSubject = BehaviorSubject<List<String>>();
  final MovieApi api = getIt<MovieApi>();

  Stream<Movie> get movieStream => _movieSubject.stream;
  Stream<List<String>> get genresStream => _genresSubject.stream;

  void init(Movie movie) async {
    _movieSubject.add(movie);
    await _loadGenres(movie);
  }

  Future<void> _loadGenres(Movie movie) async {
    try {
      var genres = await api.getGenresInMovie();
      var genreNames = movie.genreIds != null
          ? movie.genreIds!.map((id) => genres[id]).where((name) => name != null).cast<String>().toList()
          : [];
      _genresSubject.add(genreNames as List<String>);
      print('Movie loaded: ${movie.title}, Genres: ${genreNames.join(', ')}');
    } catch (error) {
      print('Failed to load genres: $error');
      _genresSubject.addError(error);
    }
  }

  void dispose() {
    _movieSubject.close();
    _genresSubject.close();
  }
}