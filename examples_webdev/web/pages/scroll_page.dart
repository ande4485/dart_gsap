import 'dart:html';

import 'package:dart_gsap/dart_gsap.dart';

class ScrollPage {
  Element getBody() {
    Future.delayed(Duration(milliseconds: 300), () {
      var tl = Gsap.timeline(TimeLineOptions(
          scrollTrigger: ScrollTriggerOptions(
              trigger: '.container',
              start: 'top center',
              end: '+=400',
              scrub: 1)));

      tl.from('.box', {
        'backgroundColor': '#28a92b',
        'rotation': 360,
        'scale': 0,
      });
    });

    final section = Element.section()
      ..children.addAll([
        Element.div()
          ..classes = ['section_scroll']
          ..children.add(HeadingElement.h2()..text = "Scroll down 👇"),
        Element.div()
          ..classes = ['section_scroll', 'container']
          ..children.add(Element.div()..classes = ['box']),
        Element.div()..classes = ['section_scroll'],
      ]);

    return section;
  }
}
