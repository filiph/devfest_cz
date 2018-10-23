import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class InfiniteScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 300.0,
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 18.0, top: 20.0),
          physics: const CustomScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.description),
              title: Text("List item #$index"),
            );
          },
        ),
      ),
    );
  }
}

class CustomSimulation extends Simulation {
  final double initPosition;
  final double velocity;

  CustomSimulation({this.initPosition, this.velocity});

  @override
  double x(double time) {
    var x = max(min(initPosition, 0.0), initPosition + velocity * time);

    return x;
  }

  @override
  double dx(double time) {
    return velocity;
  }

  @override
  bool isDone(double time) {
    return false;
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics() : super();

  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics();
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    return CustomSimulation(
      initPosition: position.pixels,
      velocity: velocity,
    );
  }
}
