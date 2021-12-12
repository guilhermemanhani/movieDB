import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/modules/home/home_controller.dart';
import 'package:moviedb/modules/home/widgets/line_filters_button.dart';
import 'package:moviedb/modules/home/widgets/header.dart';
import 'package:moviedb/modules/home/widgets/movie_banner.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Header(),
          ),
          Expanded(
            flex: 0,
            child: LineFiltersButton(),
          ),
          Expanded(
            child: Container(
              height: Get.height,
              margin: EdgeInsets.only(top: 16, bottom: 16),
              child: MovieBanner(movieModel: controller.movies),
            ),
          ),
        ],
      ),
    );
  }
}
