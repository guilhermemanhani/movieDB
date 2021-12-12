import 'package:moviedb/models/movie_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getMovies();
}
