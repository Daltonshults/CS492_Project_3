import 'package:flutter/material.dart';
import '../BoxPlaceholder/box_placeholder.dart';

class BusinessCard extends StatefulWidget {
  final String name;
  final String title;
  final String phoneNumber;
  final String github;
  final String email;

  const BusinessCard(
      {Key? key,
      required this.name,
      required this.title,
      required this.phoneNumber,
      required this.github,
      required this.email})
      : super(key: key);

  @override
  _BusinessCardState createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MediaQuery.of(context).orientation == Orientation.portrait
          ? _buildPortraitLayout()
          : _buildLandscapeLayout(),
    ));
  }

  Column _buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        paddedPlaceHolder(
            const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 5.0), 50.0, 50.0),
        paddingText(widget.name, const EdgeInsets.all(8.0),
            const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        paddingText(widget.title, const EdgeInsets.all(6.0),
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        paddingText(widget.phoneNumber, const EdgeInsets.all(6.0),
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        paddedDoubleTextRow(
            widget.github,
            widget.email,
            const EdgeInsets.all(6.0),
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Row _buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            paddedPlaceHolder(
                EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0), 160.0, 160.0),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            paddingText(widget.name, const EdgeInsets.all(8.0),
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            paddingText(widget.title, const EdgeInsets.all(6.0),
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            paddingText(widget.phoneNumber, const EdgeInsets.all(6.0),
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            paddingText(widget.github, EdgeInsets.all(8.0),
                TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            paddingText(widget.email, EdgeInsets.all(8.0),
                TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }

  Padding paddingText(String text, EdgeInsets edgeInsets, TextStyle style) {
    return Padding(
      padding: edgeInsets,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Padding paddedDoubleTextRow(
      String text1, String text2, EdgeInsets edgeInsets, TextStyle style) {
    return Padding(
      padding: edgeInsets,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: style,
          ),
          const SizedBox(width: 30.0),
          Text(
            text2,
            style: style,
          ),
        ],
      ),
    );
  }

  Container paddedPlaceHolder(
      EdgeInsets edgeInsets, double? boxheight, double? boxwidth) {
    return Container(
      padding: edgeInsets,
      child: BoxPlaceHolder(height: boxwidth, width: boxwidth, text: "image"),
    );
  }
}
