import 'package:flutter/material.dart';

class RefreshIndicatorSlide extends StatefulWidget {
  @override
  RefreshIndicatorSlideState createState() {
    return new RefreshIndicatorSlideState();
  }
}

class RefreshIndicatorSlideState extends State<RefreshIndicatorSlide> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => _refreshList(context),
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 18.0, top: 20.0),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.description),
          title: Text("Number ${numbers[index]}"),
        );
      },
    );
  }

  Future<void> _refreshList(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      numbers.shuffle();
    });
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Refreshed.')));
  }
}
