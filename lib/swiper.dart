import 'dart:async';

import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final List<Widget> children;

  final bool moveToEnd;

  Swiper({
    Key key,
    @required this.children,
    this.moveToEnd = false,
  }) : super(key: key);

  @override
  SwiperState createState() {
    return SwiperState();
  }
}

class SwiperState extends State<Swiper> {
  PageController controller = PageController(viewportFraction: 0.9);

  BuildContext _context;

  bool _pageSnapping = true;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return GestureDetector(
      onLongPress: _handleLongPress,
      onScaleEnd: _handleScale,
      child: PageView(
        pageSnapping: _pageSnapping,
        controller: controller,
        children: widget.children,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.moveToEnd) {
      Timer(const Duration(milliseconds: 50), () {
        controller.animateToPage(widget.children.length - 1,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      });
    }
  }

  void _handleLongPress() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleScale(ScaleEndDetails details) {
    print(details.velocity.pixelsPerSecond);
    showDialog(context: _context, builder: _dialogBuilder);
  }

  Widget _dialogBuilder(BuildContext context) {
    double currentPage = controller.page.roundToDouble();
    return Dialog(
      child: StatefulBuilder(
        builder: (context, setState) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  Text("Slide: ${currentPage.round()}"),
                  Slider(
                    value: currentPage,
                    max: (widget.children.length - 1).toDouble(),
                    divisions: widget.children.length,
                    onChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    onChangeEnd: (index) {
                      controller.jumpToPage(index.round());
                    },
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
