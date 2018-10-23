import 'package:flutter/material.dart';

class PicSlide extends StatelessWidget {
  final String imageUrl;

  final Color backgroundColor;

  PicSlide(
    this.imageUrl, {
    Key key,
    this.backgroundColor: Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Image.asset(
        'pics/$imageUrl',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
