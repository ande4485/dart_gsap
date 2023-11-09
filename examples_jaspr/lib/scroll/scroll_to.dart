import 'dart:html';

import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

///Don't forget to add ScrollToPlugin in html page
class ScrollToExample extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => ScrollToExampleState();
}

class ScrollToExampleState extends State<ScrollToExample> {
  @override
  void initState() {
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
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav([
      button([Text('Section 1')], id: 'section1Btn'),
      button([Text('Section 2')], id: 'section2Btn'),
      button([Text('Section 3')], id: 'section3Btn'),
    ]);
    yield div([
      h2([Text('Section 1')], id: 'section1'),
      p([
        Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nibh quam, egestas eu eros molestie, eleifend viverra augue. Suspendisse potenti. Quisque commodo consectetur quam, non pretium orci viverra at. Maecenas eget iaculis nunc. ')
      ]),
      p([
        Text(
            'Praesent at pellentesque augue. Nunc sed ullamcorper risus. Duis tincidunt consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.')
      ]),
      p([
        Text(
            'Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus')
      ]),
      h2([Text('Section 2')], id: 'section2'),
      p([
        Text(
            'consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa.')
      ]),
      p([
        Text(
            'Praesent at pellentesque augue. Nunc sed ullamcorper risus. Duis tincidunt consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.')
      ]),
      p([
        Text(
            'Mi elementum et. Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa. Cum sociis natoque penatibus et magnis dis parturient montes,')
      ]),
      h2([Text('Section 3')], id: 'section3'),
      p([
        Text(
            'Praesent at pellentesque augue. Nunc sed ullamcorper risus. Duis tincidunt consectetur condimentum. Suspendisse pharetra purus urna, ac pretium mi elementes, nascetur ridiculus mus.')
      ]),
      p([
        Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nibh quam, egestas eu eros molestie, eleifend viverra augue. Suspendisse potenti. Quisque commodo consectetur quam, non pretium orci viverra at. Maecenas eget iaculis nunc. ')
      ]),
      p([
        Text(
            'Praesent dui nibh, ullamcorper in justo sed, volutpat cursus orci. Etiam vitae sodales massa.')
      ]),
    ], classes: [
      'content'
    ]);
  }
}
