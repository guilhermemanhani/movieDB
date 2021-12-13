import 'package:moviedb/models/genre_model.dart';
import 'package:moviedb/models/movie_model.dart';
import 'package:moviedb/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getMovies() => _moviesRepository.getMovies();

  @override
  Future<List<GenreModel>> getGenres() => _moviesRepository.getGenres();
}
