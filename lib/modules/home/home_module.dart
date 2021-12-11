import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:moviedb/application/modules/module.dart';
import 'package:moviedb/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
  ];
}
