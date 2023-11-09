import 'dart:html';

import 'package:dart_gsap/dart_gsap.dart';

class SimplePage {
  Element getBody() {
    Future.delayed(Duration(milliseconds: 100), () {
      Gsap.timeline().to('.title0', {
        'duration': 0.8,
        'ease': 'back',
        'delay': 0.9,
        'scale': 7,
        'opacity': 0,
        'color': '#ffffff',
      }).from('.title1', {
        'duration': 0.8,
        'ease': 'back',
        'delay': 1,
        'x': 900,
        'opacity': 0,
        'color': '#feffa6',
      }).from('.title2', {
        'duration': 0.8,
        'x': -900,
        'ease': 'back',
        'delay': 1,
        'opacity': 0,
        'color': '#feffa6',
      }).from('.title3', {
        'duration': 0.8,
        'x': 900,
        'ease': 'back',
        'delay': 1,
        'opacity': 0,
        'color': '#feffa6',
      });
    });

    final section = Element.section()
      ..classes = ['section']
      ..children.addAll([
        HeadingElement.h2()
          ..classes = ['title', 'title0']
          ..children.add(Element.span()..text = "Ok, I'll get out here"),
        HeadingElement.h2()
          ..classes = ['title', 'title1']
          ..children.add(Element.span()..text = "You can"),
        HeadingElement.h2()
          ..classes = ['title', 'title2']
          ..children.add(Element.span()..text = "make anything"),
        HeadingElement.h2()
          ..classes = ['title', 'title3']
          ..children.add(Element.span()..text = "with that"),
      ]);

    return section;
  }
}
