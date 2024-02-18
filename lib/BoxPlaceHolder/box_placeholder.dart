import 'package:flutter/material.dart';

class BoxPlaceHolder extends StatelessWidget {
  final double? height;
  final double? width;
  final String? text;
  const BoxPlaceHolder(
      {super.key, required this.height, required this.width, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Placeholder(
          child: Center(child: Text(text!)),
        ));
  }
}
