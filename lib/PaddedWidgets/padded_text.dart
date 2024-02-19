import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import '../BoxPlaceholder/box_placeholder.dart';

class PaddedText extends StatefulWidget {
  final String text;
  final EdgeInsets edgeInsets;
  final TextStyle style;
  final TextAlign? textAlign;

  const PaddedText(
      {super.key,
      required this.text,
      required this.edgeInsets,
      required this.style,
      this.textAlign});

  @override
  State<PaddedText> createState() => _PaddedTextState();
}

class _PaddedTextState extends State<PaddedText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsets,
      child: Text(
        widget.text,
        style: widget.style,
        textAlign: widget.textAlign,
      ),
    );
  }
}

class PaddedDoubleText extends StatefulWidget {
  final String text1;
  final String text2;
  final EdgeInsets edgeInsets;
  final TextStyle style;

  const PaddedDoubleText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.edgeInsets,
      required this.style});

  @override
  State<PaddedDoubleText> createState() => _PaddedDoubleTextState();
}

class _PaddedDoubleTextState extends State<PaddedDoubleText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsets,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text1,
            style: widget.style,
          ),
          const SizedBox(width: 30.0),
          Text(
            widget.text2,
            style: widget.style,
          ),
        ],
      ),
    );
  }
}

class PaddedDoubleTextLinks extends StatefulWidget {
  final String text1;
  final String text2;
  final EdgeInsets edgeInsets;
  final TextStyle style;

  const PaddedDoubleTextLinks(
      {super.key,
      required this.text1,
      required this.text2,
      required this.edgeInsets,
      required this.style});

  @override
  State<PaddedDoubleTextLinks> createState() => _PaddedDoubleLinksTextState();
}

class _PaddedDoubleLinksTextState extends State<PaddedDoubleTextLinks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsets,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final url = Uri.parse("http://${widget.text1}");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              widget.text1,
              style: widget.style,
            ),
          ),
          const SizedBox(width: 30.0),
          GestureDetector(
            onTap: () async {
              final url = Uri.parse("http://${widget.text2}");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              widget.text2,
              style: widget.style,
            ),
          )
        ],
      ),
    );
  }
}

class PaddedPlaceHolder extends StatefulWidget {
  final EdgeInsets edgeInsets;
  final double boxHeight;
  final double boxWidth;

  const PaddedPlaceHolder(
      {super.key,
      required this.edgeInsets,
      required this.boxHeight,
      required this.boxWidth});

  @override
  State<PaddedPlaceHolder> createState() => _PaddedPlaceHolderState();
}

class _PaddedPlaceHolderState extends State<PaddedPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.edgeInsets,
      child: BoxPlaceHolder(
          height: widget.boxHeight, width: widget.boxWidth, text: "image"),
    );
  }
}
