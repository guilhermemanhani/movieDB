import 'package:get/get.dart';
import './detail_controller.dart';

class DetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController(moviesService: Get.find()));
  }
}
