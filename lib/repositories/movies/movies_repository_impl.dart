import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:moviedb/application/rest_client/rest_client.dart';
import 'package:moviedb/models/genre_model.dart';
import 'package:moviedb/models/movie_model.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;
  @override
  Future<List<MovieModel>> getMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final result = data['results'];
        if (result != null) {
          return result
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }

        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      throw Exception('Erro ao buscar filmes');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>((genre) => GenreModel.fromMap(genre))
              .toList();
        }
        return <GenreModel>[];
      },
    );

    if (result.hasError) {
      throw Exception('Erro ao buscar os tipos de genero');
    }

    return result.body ?? <GenreModel>[];
  }
}
