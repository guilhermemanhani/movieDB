import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = controller.movie.value;

    return Scaffold(
      body: Container(
        child: Obx(
          () {
            return Text(
              controller.movie.value?.title ?? '',
            );
          },
        ),
      ),
    );
  }
}
