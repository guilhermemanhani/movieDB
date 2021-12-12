import 'package:moviedb/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getMovies();
}
