import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({super.key, required this.title, this.height, this.width});
  final double? height;
  final double? width;

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        color: theme.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: theme.colorScheme.background,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
