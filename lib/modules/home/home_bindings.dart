import 'package:get/get.dart';
import 'package:moviedb/modules/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(moviesService: Get.find()));
  }
}
