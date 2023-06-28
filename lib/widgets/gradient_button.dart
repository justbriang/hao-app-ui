import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {super.key, required this.title, this.height, this.width});
  final double? height;
  final double? width;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF8e44ad), Color(0xFFee9ca7), Color(0xFFffdde1)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
