import 'package:devfest_cz/style/style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 30.0),
              child: SizedBox(
                width: 100.0,
                child: Image.asset('pics/devfest-logo.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 32.0),
                Text(
                  'Things you didn’t know\nabout Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cormorant',
                    fontSize: 54.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  'Filip Hráček, Google',
                  style: normal,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
