import 'package:flutter/material.dart';

class GestureArenaDemo extends StatefulWidget {
  @override
  _GestureArenaDemoState createState() => _GestureArenaDemoState();
}

class _GestureArenaDemoState extends State<GestureArenaDemo> {
  bool _firstHighlighted = false;
  bool _secondHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _switchFirst,
            child: _buildButton('Just click', _firstHighlighted),
          ),
          SizedBox(width: 64.0),
          GestureDetector(
            onTap: _switchSecond,
            onDoubleTap: _switchSecond,
            child: _buildButton('Click or double click', _secondHighlighted),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool highlighted) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 8.0,
            color: Colors.purple,
            style: highlighted ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.purple),
          ),
        ),
      );

  void _switchFirst() {
    setState(() {
      _firstHighlighted = !_firstHighlighted;
    });
  }

  void _switchSecond() {
    setState(() {
      _secondHighlighted = !_secondHighlighted;
    });
  }
}
