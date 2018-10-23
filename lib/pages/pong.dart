import 'package:flutter/material.dart';

class Pong extends StatefulWidget {
  @override
  PongState createState() {
    return new PongState();
  }
}

class PongState extends State<Pong> with SingleTickerProviderStateMixin<Pong> {
  double _x = 0.3;
  double _y = 0.5;
  double _vx = 0.0;
  double _vy = 0.0;

  static const width = 300.0;
  static const height = 300.0;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 100.0,
        duration: const Duration(seconds: 100),
        vsync: this);
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Container(
            color: Colors.cyan,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  print('reset');
                  _x = 30.0;
                  _y = 20.0;
                  _vx = 0.0;
                  _vy = 0.0;
                  return _controller.forward(from: 0.0);
                },
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Container(
                    color: Colors.black,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final duration = 10.0;
                        _x += _vx * duration;
                        _y += _vy * duration;

                        if (_y > height) {
                          _vy = -_vy.abs();
                        } else if (_y < 0) {
                          _vy = _vy.abs();
                        } else if (orientation == Orientation.landscape) {
                          _vy += 0.01 * duration;
                        }

                        if (_x > width) {
                          _vx = -_vx.abs();
                        } else if (_x < 0) {
                          _vx = _vx.abs();
                        } else if (orientation == Orientation.portrait) {
                          _vx += 0.01 * duration;
                        }

                        return Align(
                          alignment: Alignment(
                            (_x / width - (10 / width)) * 2.0 - 1.0,
                            (_y / height - (10 / height)) * 2.0 - 1.0,
                          ),
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.add_circle,
                        size: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
