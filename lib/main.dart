import 'package:devfest_cz/pages/animated_container.dart';
import 'package:devfest_cz/pages/animated_font.dart';
import 'package:devfest_cz/pages/async_generator.dart';
import 'package:devfest_cz/pages/compute.dart';
import 'package:devfest_cz/pages/gesture_arena.dart';
import 'package:devfest_cz/pages/hero.dart';
import 'package:devfest_cz/pages/homepage.dart';
import 'package:devfest_cz/pages/infinite_scroll.dart';
import 'package:devfest_cz/pages/listview.dart';
import 'package:devfest_cz/pages/nima.dart';
import 'package:devfest_cz/pages/pic_slide.dart';
import 'package:devfest_cz/pages/refresh_indicator.dart';
import 'package:devfest_cz/pages/slide.dart';
import 'package:devfest_cz/pages/splash.dart';
import 'package:devfest_cz/slide_deck.dart';
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
        body: _buildSlideDeck(),
      ),
    );
  }

  Widget _buildSlideDeck() {
    return SlideDeck(
      children: [
        SplashScreen('Things you didn’t know\nabout Flutter'),
        MyHomePage(),
        Slide('Most code was written in 1842.'),
        PicSlide('1842.jpg', backgroundColor: Colors.black),
        Slide('Where does it come from?'),
        Slide('Google Chrome'),
        Slide('How much can we remove\n'
            'from the web platform?'),
        Slide('Architecture'),
        PicSlide('arch0.png'),
        Slide('Native, or native?'),
        PicSlide('arch1.png'),
        Slide('Machine code\n&\nOpenGL / Vulcan'),
        Slide('Flutter is a game engine,\nfor apps.'),
        ListViewDemo(),
        NimaSlide('Wolf', 'Run', backgroundColor: Colors.lightBlue),
        NimaSlide('Robot', 'Flight', backgroundColor: Colors.black),
        Slide('Why this way?'),
        PicSlide('top-apps.png'),
        Slide('Remember the web\n15 years ago?'),
        PicSlide('web.png'),
        Slide('Debug x Production'),
        Slide('Composition over Inheritance'),
        Slide('Extreme\nComposition over Inheritance'),
        Slide('Only one code path.'),
        InfiniteScroll(),
        Slide('Building from scratch,\nall the time.'),
        Slide('How can this be fast?'),
        PicSlide('tree.png'),
        Slide('Dart'),
        PicSlide('erik-meijer.png'),
        AsyncGeneratorDemo(),
        Slide('Isolates'),
        ComputeSlide(),
        Slide('Widgets'),
        AnimatedContainerSlide(),
        AnimatedFontSlide(),
        Slide('GestureArena'),
        GestureArenaDemo(),
        Slide('RefreshIndicator'),
        RefreshIndicatorSlide(),
        Slide('SafeArea'),
        Slide('Acessibility'),
        Slide('Hero'),
        HeroSlide(),
        Slide('PageView'),
        SplashScreen('Thank you!'),
      ],
    );
  }
}
