import 'package:flutter/material.dart';
import 'package:moviedb/application/ui/theme_extensions.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final double width;
  final GestureTapCallback onTap;

  const RoundedButtonWithIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 2,
              ),
              child: Icon(
                icon,
                color: context.greyBlue,
                size: 16,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: context.greyBlue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
