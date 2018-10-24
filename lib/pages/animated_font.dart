import 'package:devfest_cz/style/style.dart';
import 'package:flutter/material.dart';

class AnimatedFontSlide extends StatefulWidget {
  @override
  _AnimatedFontSlideState createState() => _AnimatedFontSlideState();
}

class _AnimatedFontSlideState extends State<AnimatedFontSlide> {
  static const List<TextStyle> styles = [
    TextStyle(),
    TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w900,
    ),
    TextStyle(
      color: Colors.lightBlueAccent,
      fontWeight: FontWeight.w900,
      fontSize: 44.0,
    ),
    TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w100,
      fontSize: 44.0,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            style: normal.merge(styles[index]),
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: Container(
              color: Colors.black,
              child: GestureDetector(
                onTap: _changeStyle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 24.0,
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text('AnimatedDefaultTextStyle',
              style: normal.apply(color: Colors.black)),
        ],
      ),
    );
  }

  void _changeStyle() {
    setState(() {
      index += 1;
      if (index >= styles.length) index = 0;
    });
  }
}
