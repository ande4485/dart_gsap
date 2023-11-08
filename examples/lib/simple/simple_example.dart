import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class SimpleExample extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => SimpleExampleState();
}

class SimpleExampleState extends State<SimpleExample> {
  @override
  void initState() {
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
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      h2([Text("Ok, I'll get out here")], classes: ['title', 'title0']),
      h2([Text("You can")], classes: ['title', 'title1']),
      h2([Text("make anything")], classes: ['title', 'title2']),
      h2([Text("with that")], classes: ['title', 'title3']),
    ], classes: [
      'section'
    ]);
  }
}
