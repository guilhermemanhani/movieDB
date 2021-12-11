import 'package:flutter/material.dart';
import 'package:moviedb/modules/home/widgets/button_filter.dart';

class LineFiltersButton extends StatelessWidget {
  const LineFiltersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ButtonFilter(
              genre: 'Ação',
              onPressed: () {},
              selected: true,
            ),
            ButtonFilter(
              genre: 'Aventura',
              onPressed: () {},
              selected: false,
            ),
            ButtonFilter(
              genre: 'Fantasia',
              onPressed: () {},
              selected: false,
            ),
            ButtonFilter(
              genre: 'Comédia',
              onPressed: () {},
              selected: false,
            ),
          ],
        ),
      ),
    );
  }
}
