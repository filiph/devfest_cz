import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: Icon(Icons.airport_shuttle),
        title: Text('Platform specific'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 18.0, top: 20.0),
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
