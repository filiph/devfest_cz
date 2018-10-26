import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PicSlide extends StatelessWidget {
  static final transparent = MemoryImage(kTransparentImage);

  final String imageUrl;

  final Color backgroundColor;

  final BoxFit fit;

  PicSlide(
    this.imageUrl, {
    Key key,
    this.backgroundColor: Colors.white,
    this.fit: BoxFit.contain,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: FadeInImage(
        fadeInDuration: const Duration(milliseconds: 200),
        placeholder: transparent,
        image: AssetImage('pics/$imageUrl'),
        fit: fit,
      ),
    );
  }
}
