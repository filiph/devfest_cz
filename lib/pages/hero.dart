import 'package:devfest_cz/style/style.dart';
import 'package:flutter/material.dart';

class HeroSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: GestureDetector(
          onTap: () => _handleTap(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200.0,
                child: Hero(
                  tag: '1842',
                  child: Image.asset('pics/1842.jpg'),
                ),
              ),
              Expanded(
                  child: Text(
                'Google Building 1842',
                style: medieval.apply(color: Colors.black),
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Hero(
                  tag: '1842',
                  child: Image.asset('pics/1842.jpg'),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
