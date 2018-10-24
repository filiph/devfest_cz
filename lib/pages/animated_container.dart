import 'package:devfest_cz/style/style.dart';
import 'package:flutter/material.dart';

class AnimatedContainerSlide extends StatefulWidget {
  @override
  _AnimatedContainerSlideState createState() => _AnimatedContainerSlideState();
}

class _AnimatedContainerSlideState extends State<AnimatedContainerSlide> {
  double _bigness = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(_bigness),
            ),
            padding: EdgeInsets.all(16.0 + _bigness / 2),
            duration: const Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            child: GestureDetector(
              onTap: _changeRadius,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Click me.'),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text('AnimatedContainer', style: normal),
        ],
      ),
    );
  }

  void _changeRadius() {
    setState(() {
      _bigness += 20;
      if (_bigness >= 100) _bigness = 1.0;
    });
  }
}
