import 'dart:math';

import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final String mainText;

  final double fontSize;

  final Tuple<Color, double> _colorTuple;

  Slide(
    this.mainText, {
    Key key,
  })  : _colorTuple = _getRandomColor(mainText.hashCode),
        fontSize = _getFontSize(mainText.length),
        super(key: key);

  Color get backgroundColor => _colorTuple.first;

  double get luminance => _colorTuple.second;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _buildText(luminance > 0.20 ? Colors.black : Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(Color color) {
    return Text(
      mainText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'IMFellGreatPrimer',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static double _getFontSize(int length) {
    final t = min(length / 40, 1.0);
    return Tween(begin: 62.0, end: 42.0).transform(t);
  }

  static Tuple<Color, double> _getRandomColor(int seed) {
    final random = Random(seed);
    final color = Colors.primaries[random.nextInt(Colors.primaries.length)];
    final luminance = color.computeLuminance();
    return Tuple(color, luminance);
  }
}

class Tuple<T, S> {
  final T first;
  final S second;

  Tuple(this.first, this.second);
}
