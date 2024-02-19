import "package:call_me_maybe/PaddedWidgets/padded_text.dart";
import "package:flutter/material.dart";

class ResumeCard extends StatefulWidget {
  const ResumeCard({super.key});

  @override
  State<ResumeCard> createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? _buildPortraitLayout()
          : _buildLandscapeLayout(),
    );
  }

  Column _buildPortraitLayout() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: [portraitNamePlate()]),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: experienceListing());
                  }))
        ]);
  }

  Row _buildLandscapeLayout() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[Text("Resume")]);
  }

  Widget portraitNamePlate() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PaddedText(
            text: "Jane Smith",
            edgeInsets: EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        PaddedText(
            text: "jsmithexample@oregonstate.edu",
            edgeInsets: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        PaddedText(
            text: "https://github.com/jsmith",
            edgeInsets: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget jobPositionHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        PaddedText(
            text: "Software Developer Intern",
            edgeInsets: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
      ],
    );
  }

  Widget nameDateLocationHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: PaddedText(
          text: "Ecorp",
          edgeInsets: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.left, // Left align
        )),
        Expanded(
            child: PaddedText(
          text: "2016-Present",
          edgeInsets: EdgeInsets.all(0.0),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center, // Left align
        )),
        Expanded(
            child: PaddedText(
          text: "Springfield, OR",
          edgeInsets: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.right, // Left align
        )),
      ],
    );
  }

  Widget experienceListingText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            child: PaddedText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                edgeInsets: EdgeInsets.all(3.0),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)))
      ],
    );
  }

  Widget experienceListing() {
    double screenWidth = MediaQuery.of(context).size.width * .75;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        jobPositionHeader(),
        nameDateLocationHeader(),
        experienceListingText(),
      ],
    );
  }
}
