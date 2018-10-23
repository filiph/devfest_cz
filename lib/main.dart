import 'package:devfest_cz/pages/homepage.dart';
import 'package:devfest_cz/pages/nima.dart';
import 'package:devfest_cz/pages/pic_slide.dart';
import 'package:devfest_cz/pages/pong.dart';
import 'package:devfest_cz/pages/slide.dart';
import 'package:devfest_cz/pages/splash.dart';
import 'package:devfest_cz/swiper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest CZ slide deck',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Swiper(
          moveToEnd: true,
          children: [
            SplashScreen(),
            MyHomePage(title: 'Hello DevFest CZ'),
            Slide('Where does it come from?'),
            Slide('Most code was written in 1842.'),
            PicSlide('1842.jpg'),
            Slide('Google Chrome'),
            Slide('How much can we remove\n'
                'from the web platform?'),
            Slide('Architecture'),
            PicSlide('arch0.png'),
            Slide('Native, or native?'),
            PicSlide('arch1.png'),
            Slide('Why this way?'),
            PicSlide('top-apps.png'),
            Slide('Remember the web\n15 years ago?'),
            PicSlide('web.png'),
            Slide('Debug x Production'),
            Slide('Composition over Inheritance'),
            Transform.rotate(
              angle: 0.2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Slide('‘Extreme\nComposition over Inheritance’'),
              ),
            ),
            Transform.rotate(
              angle: -0.1,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 50.0, horizontal: 200.0),
                child: MyHomePage(title: 'App in an app'),
              ),
            ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                leading: Icon(Icons.airport_shuttle),
                title: Text('Infinite list'),
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
            ),
            NimaSlide(),
            Pong(),
          ],
        ),
      ),
    );
  }
}
