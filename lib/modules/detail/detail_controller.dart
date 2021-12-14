import 'package:get/get.dart';
import 'package:moviedb/application/ui/loader/loader_mixin.dart';
import 'package:moviedb/application/ui/messages/messages_mixin.dart';
import 'package:moviedb/models/movie_detail_model.dart';
import 'package:moviedb/services/movies/movies_service.dart';

class DetailController extends GetxController with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();

  DetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  var load = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(load);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final id = Get.arguments;
      load(true);
      final movieDetail = await _moviesService.getDetail(id);
      movie.value = movieDetail;
      load(false);
    } catch (e, s) {
      print(e);
      print(s);
      load(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar detalhe do filme'));
    }
  }
}
