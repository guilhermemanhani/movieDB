import 'package:moviedb/models/genre_model.dart';
import 'package:moviedb/models/movie_detail_model.dart';
import 'package:moviedb/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getMovies();
  Future<List<GenreModel>> getGenres();
  Future<MovieDetailModel?> getDetail(int id);
}
