import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/application/ui/theme_extensions.dart';
import 'package:moviedb/modules/home/home_controller.dart';

class Header extends GetView<HomeController> {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Filmes',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (val) => controller.filterName(val),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: context.white,
                  filled: true,
                  labelText: 'Pesquise filmes',
                  labelStyle: TextStyle(color: context.grey),
                  prefixIcon: const Icon(Icons.search)),
            ),
          ],
        ),
      ),
    );
  }
}
