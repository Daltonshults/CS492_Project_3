import 'package:flutter/material.dart';
import 'dart:math';

import '../PaddedWidgets/padded_text.dart';

class Predictor extends StatefulWidget {
  final Random rng = Random();
  final List<String> magic8BallResponses = [
    "Outlook not so good.",
    "Signs point to yes.",
    "Cannot predict now.",
    "Reply hazy, try again later.",
    "Better not tell you now.",
    "As I see it, yes.",
    "Concentrate and ask again.",
    "My sources say no."
  ];

  Predictor({super.key});

  @override
  State<Predictor> createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  int predictor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is a widget that contains the structure of the page
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? _buildPortraitLayout()
          : _buildLandscapeLayout(),
    );
  }

  Widget _buildPortraitLayout() {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
        child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PaddedText(
            text: "Call me... Maybe?",
            edgeInsets: EdgeInsets.only(top: .25 * screenHeight),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [predictorButton()],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PaddedText(
              edgeInsets: EdgeInsets.all(0.0),
              text: "Maybe indeed.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
        ],
      )
    ]));
  }

  Widget _buildLandscapeLayout() {
    return _buildPortraitLayout();
  }

  Widget predictorButton() {
    return ElevatedButton(
      onPressed: randomPrediction,
      child: Text(widget.magic8BallResponses[predictor]),
    );
  }

  void randomPrediction() {
    setState(() {
      predictor = widget.rng.nextInt(widget.magic8BallResponses.length);
    });
  }
}
