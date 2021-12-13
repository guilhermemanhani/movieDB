import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/modules/home/home_controller.dart';
import 'package:moviedb/modules/home/widgets/button_filter.dart';

class LineFiltersButton extends GetView<HomeController> {
  const LineFiltersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () {
            return Row(
              children: controller.genres
                  .map(
                    (gen) => ButtonFilter(
                      genre: gen,
                      onPressed: () => controller.filterGenre(gen),
                      selected: controller.genreSelected.value?.id == gen.id,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
