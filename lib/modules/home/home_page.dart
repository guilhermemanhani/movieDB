import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/modules/home/widgets/line_filters_button.dart';
import 'package:moviedb/modules/home/widgets/header.dart';
import 'package:moviedb/modules/home/widgets/movie_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          Header(),
          LineFiltersButton(),
          MovieBanner(),
          MovieBanner(),
        ],
      ),
    ));
  }
}
