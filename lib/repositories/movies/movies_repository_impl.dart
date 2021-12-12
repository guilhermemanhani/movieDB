import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:moviedb/application/rest_client/rest_client.dart';
import 'package:moviedb/models/movie_model.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<MovieModel>> getMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'languege': 'pt-br',
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
}
