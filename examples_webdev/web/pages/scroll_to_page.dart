import 'dart:html';

import 'package:dart_gsap/dart_gsap.dart';

class ScrollToPage {
  Element getBody() {
    Future.delayed(Duration(milliseconds: 300), () {
      Future.delayed(Duration(milliseconds: 100), () {
        var btn = document.querySelectorAll("nav button");

        for (int i = 0; i < btn.length; i++) {
          btn[i].addEventListener("click", (event) {
            var index = i + 1;
            Gsap.to(window, {
              'duration': 1,
              'scrollTo': {'y': "#section$index", 'offsetY': 70}
            });
          });
        }
      });
    });

    final section = Element.div()
      ..children.addAll([
        Element.nav()
          ..children.addAll([
            ButtonElement()
              ..text = "Section 1"
              ..id = 'section1Btn',
            ButtonElement()
              ..text = "Section 2"
              ..id = 'section2Btn',
            ButtonElement()
              ..text = "Section 3"
              ..id = 'section3Btn',
          ]),
        Element.div()
          ..classes = ['content']
          ..children.addAll([
            HeadingElement.h2()
              ..id = 'section1'
              ..text = 'Section 1',
            Element.p()
              ..text =
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nibh quam, egestas eu eros molestie, eleifend viverra augue. Suspendisse potenti. Quisque commodo consectetur quam, non pretium orci viverra at. Maecenas eget iaculis nunc. ",
            Element.p()
              ..text =
                  "Praesent at pellentesque augue. Nunc sed ullamcorper risus. Duis tincidunt consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ",
            Element.p()
              ..text =
                  "Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus",
            HeadingElement.h2()
              ..id = 'section2'
              ..text = 'Section 2',
            Element.p()
              ..text =
                  "consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa.",
            Element.p()
              ..text =
                  "Praesent at pellentesque augue. Nunc sed ullamcorper risus. Duis tincidunt consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ",
            Element.p()
              ..text =
                  "Mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes,",
            HeadingElement.h2()
              ..id = 'section3'
              ..text = 'Section 3',
            Element.p()
              ..text =
                  "Praesent at pellentesque augue. Nunc sed ullamcorper risus. Duis tincidunt consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementes, nascetur ridiculus mus.",
            Element.p()
              ..text =
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nibh quam, egestas eu eros molestie, eleifend viverra augue. Suspendisse potenti. Quisque commodo consectetur quam, non pretium orci viverra at. Maecenas eget iaculis nunc. ",
            Element.p()
              ..text =
                  "Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa."
          ]),
      ]);

    return section;
  }
}
