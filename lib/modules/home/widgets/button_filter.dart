import 'package:flutter/material.dart';
import 'package:moviedb/application/ui/theme_extensions.dart';

class ButtonFilter extends StatelessWidget {
  final String genre;
  final bool selected;
  final VoidCallback onPressed;
  const ButtonFilter({
    Key? key,
    required this.genre,
    required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        constraints: const BoxConstraints(
          minWidth: 54,
          minHeight: 30,
        ),
        decoration: BoxDecoration(
            color: selected ? context.darkBlue : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: context.grey)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              genre,
              style: TextStyle(
                color: selected ? Colors.white : context.darkBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
