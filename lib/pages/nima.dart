import 'package:flutter/material.dart';

class NimaSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [
          Colors.deepOrange,
          Colors.orange,
        ],
        focal: Alignment.topCenter,
        radius: 1.0,
      )),
      child: RepaintBoundary(
        child: Text('TODO: implement Nima'),
//        NimaActor(
//          'pics/Wolf',
//          alignment: Alignment.center,
//          fit: BoxFit.scaleDown,
//          animation: 'Run',
//          paused: true,
//        ),
      ),
    );
  }
}
