import 'dart:async';

import 'package:devfest_cz/style/style.dart';
import 'package:flutter/material.dart';

class SlideDeck extends StatefulWidget {
  final List<Widget> children;

  final bool moveToEnd;

  SlideDeck({
    Key key,
    @required this.children,
    this.moveToEnd = false,
  }) : super(key: key);

  @override
  SlideDeckState createState() {
    return SlideDeckState();
  }
}

class SlideDeckState extends State<SlideDeck> {
  PageController controller = PageController(viewportFraction: 0.9);

  BuildContext _context;

  bool _pageSnapping = true;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return DefaultTextStyle(
      style: medieval,
      child: GestureDetector(
        onLongPress: _handleLongPress,
        onScaleEnd: _handleScale,
        child: PageView(
          pageSnapping: _pageSnapping,
          controller: controller,
          children: widget.children,
        ),
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
      _waitThenScrollToEnd();
    }
  }

  Future<void> _waitThenScrollToEnd() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Wait until the app is running.
    while (widget?.children?.length == null || !controller.hasClients) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    controller.animateToPage(
      widget.children.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Dialog(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70.0),
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
                  SizedBox(height: 20.0),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'CLOSE',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
