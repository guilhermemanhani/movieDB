import 'package:flutter/material.dart';
import 'package:moviedb/application/ui/theme_extensions.dart';

class GenresContainer extends StatelessWidget {
  final String genre;

  const GenresContainer({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 68,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: context.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(genre),
      ),
    );
  }
}
