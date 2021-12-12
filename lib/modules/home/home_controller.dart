import 'package:get/get.dart';
import 'package:moviedb/application/ui/messages/messages_mixin.dart';
import 'package:moviedb/models/movie_model.dart';
import 'package:moviedb/services/movies/movies_service.dart';

class HomeController extends GetxController with MessagesMixin {
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();

  HomeController({required MoviesService moviesService})
      : _moviesService = moviesService;

  final movies = <MovieModel>[].obs;
  var _moviesOriginal = <MovieModel>[];

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final moviesResult = await _moviesService.getMovies();
      movies.assignAll(moviesResult);
      _moviesOriginal = moviesResult;
    } catch (e, s) {
      print(s);
      print(e);
      _message(
          MessageModel.error(title: 'Erro', message: 'Erro ao buacar filmes'));
    }
  }

  void filterName(String title) {
    if (title.isNotEmpty) {
      var filterMovie = _moviesOriginal.where(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase()));
      movies.assignAll(filterMovie);
    } else {
      movies.assignAll(_moviesOriginal);
    }
  }
}
