import 'package:get/get.dart';
import 'package:moviedb/application/ui/messages/messages_mixin.dart';
import 'package:moviedb/models/genre_model.dart';
import 'package:moviedb/models/movie_model.dart';
import 'package:moviedb/services/movies/movies_service.dart';

class HomeController extends GetxController with MessagesMixin {
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();

  HomeController({required MoviesService moviesService})
      : _moviesService = moviesService;

  final movies = <MovieModel>[].obs;
  var _moviesOriginal = <MovieModel>[];
  final genres = <GenreModel>[].obs;
  final genreSelected = Rxn<GenreModel>();

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      var moviesResult = await _moviesService.getMovies();
      final genresResult = await _moviesService.getGenres();

      translateGenres(moviesResult, genresResult);

      movies.assignAll(moviesResult);
      genres.assignAll(genresResult);
      _moviesOriginal = moviesResult;
    } catch (e, s) {
      print(s);
      print(e);
      _message(
          MessageModel.error(title: 'Erro', message: 'Erro ao buscar na api'));
    }
  }

  void translateGenres(
      List<MovieModel> moviesResult, List<GenreModel> genresResult) {
    for (var movie in moviesResult) {
      for (var movieId in movie.genres) {
        for (var genreId in genresResult) {
          if (genreId.id == movieId) {
            movie.genresString = '${movie.genresString} - ${genreId.name}';
          }
        }
      }
    }
  }

  void filterName(String title) {
    if (title.isNotEmpty) {
      var filterMovieName = _moviesOriginal.where(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase()));
      movies.assignAll(filterMovieName);
    } else {
      movies.assignAll(_moviesOriginal);
    }
  }

  void filterGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;
    if (genreModel != null) {
      var filterMovieGenre = _moviesOriginal
          .where((movie) => movie.genres.contains(genreModel?.id));
      movies.assignAll(filterMovieGenre);
    }
  }
}
