import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:moviedb/application/modules/module.dart';
import 'package:moviedb/modules/detail/detail_bindings.dart';
import 'package:moviedb/modules/detail/detail_page.dart';

class DetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => DetailPage(),
      binding: DetailBindings(),
    ),
  ];
}
