import 'package:devfest_cz/style/style.dart';
import 'package:flutter/material.dart';

class AsyncGeneratorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: myAsyncGenerator().asBroadcastStream(),
      initialData: 1,
      builder: (context, snapshot) {
        return Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              snapshot.data.toString(),
              style: normal.apply(fontSizeFactor: 4.0),
            ),
          ),
        );
      },
    );
  }

  Stream<int> myAsyncGenerator() async* {}
}
