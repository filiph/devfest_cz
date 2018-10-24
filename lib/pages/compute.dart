import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeSlide extends StatefulWidget {
  @override
  ComputeSlideState createState() {
    return new ComputeSlideState();
  }
}

class ComputeSlideState extends State<ComputeSlide> {
  int _n = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 40.0,
        color: Colors.black,
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              min: 1.0,
              max: 40.0,
              value: _n.toDouble(),
              onChanged: (value) {
                setState(() {
                  _n = value.toInt();
                });
              },
            ),
            Text('fib($_n) = '),
            FibonacciResult(n: _n),
          ],
        ),
      ),
    );
  }
}

class FibonacciResult extends StatelessWidget {
  final int n;

  FibonacciResult({
    Key key,
    this.n,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: compute(fibonacci, n),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return Container(
          child: Center(
            child: Text('${snapshot.data}'),
          ),
        );
      },
    );
  }

  static int fibonacci(int n) {
    return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
  }
}
