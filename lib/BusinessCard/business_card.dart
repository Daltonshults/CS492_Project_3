import 'package:flutter/material.dart';
import '../PaddedWidgets/padded_text.dart';
import 'package:url_launcher/url_launcher.dart';

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
  BusinessCardState createState() => BusinessCardState();
}

class BusinessCardState extends State<BusinessCard> {
  final basicTextStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  final basicInsets = const EdgeInsets.all(8.0);

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
        const PaddedPlaceHolder(
            edgeInsets: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 5.0),
            boxHeight: 50.0,
            boxWidth: 50.0),
        PaddedText(
            text: widget.name,
            edgeInsets: basicInsets,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        PaddedText(
            text: widget.title,
            edgeInsets: const EdgeInsets.all(6.0),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        phoneNumberField(),
        PaddedDoubleTextLinks(
            text1: widget.github,
            text2: widget.email,
            edgeInsets: const EdgeInsets.all(6.0),
            style: basicTextStyle),
      ],
    );
  }

  GestureDetector phoneNumberField() {
    return GestureDetector(
      // Works on my phone, but not on the emulator.
      onTap: () async {
        final url = 'sms:${widget.phoneNumber.replaceAll(' ', '')}';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: PaddedText(
          text: widget.phoneNumber,
          edgeInsets: const EdgeInsets.all(6.0),
          style: basicTextStyle),
    );
  }

  Row _buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaddedPlaceHolder(
                edgeInsets: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                boxHeight: 160.0,
                boxWidth: 160.0),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PaddedText(
                text: widget.name,
                edgeInsets: basicInsets,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            PaddedText(
                text: widget.title,
                edgeInsets: const EdgeInsets.all(6.0),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            PaddedText(
                text: widget.phoneNumber,
                edgeInsets: const EdgeInsets.all(6.0),
                style: basicTextStyle),
            PaddedText(
                text: widget.github,
                edgeInsets: basicInsets,
                style: basicTextStyle),
            PaddedText(
                text: widget.email,
                edgeInsets: basicInsets,
                style: basicTextStyle),
          ],
        )
      ],
    );
  }
}
