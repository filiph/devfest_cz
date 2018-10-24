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
  double _value = 1.0;

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
            StatefulBuilder(
              builder: (context, innerSetState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 30.0),
                    Text('fib(${_value.round()}) = '),
                    Slider(
                      min: 1.0,
                      max: 40.0,
                      value: _value,
                      onChanged: (value) {
                        innerSetState(() {
                          _value = value;
                        });
                      },
                      onChangeEnd: (value) {
                        setState(() {
                          _n = value.toInt();
                        });
                      },
                    ),
                  ],
                );
              },
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 50.0),
              child: FibonacciResult(n: _n, key: ValueKey(_n)),
            ),
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
          return SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: Text('${snapshot.data}'),
        );
      },
    );
  }

  static int fibonacci(int n) {
    return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
  }
}
