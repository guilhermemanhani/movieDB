import 'package:get/get.dart';
import 'package:moviedb/application/rest_client/rest_client.dart';
import 'package:moviedb/repositories/movies/movies_repository.dart';
import 'package:moviedb/repositories/movies/movies_repository_impl.dart';
import 'package:moviedb/services/movies/movies_service.dart';
import 'package:moviedb/services/movies/movies_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()));
  }
}
