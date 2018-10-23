import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';

class NimaSlide extends StatefulWidget {
  final String filename;

  final String animation;

  final Color backgroundColor;

  NimaSlide(
    this.filename,
    this.animation, {
    Key key,
    this.backgroundColor: Colors.black,
  }) : super(key: key);

  @override
  NimaSlideState createState() {
    return new NimaSlideState();
  }
}

class NimaSlideState extends State<NimaSlide> {
  bool _paused = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _paused = !_paused;
        });
      },
      child: Container(
        color: widget.backgroundColor,
        child: RepaintBoundary(
          child: NimaActor(
            'pics/${widget.filename}',
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            animation: widget.animation,
            paused: _paused,
          ),
        ),
      ),
    );
  }
}
