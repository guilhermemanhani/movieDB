import 'package:moviedb/models/genre_model.dart';
import 'package:moviedb/models/movie_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getMovies();
  Future<List<GenreModel>> getGenres();
}
