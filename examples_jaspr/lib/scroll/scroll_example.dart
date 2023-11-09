import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class ScrollExample extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => ScrollExampleState();
}

class ScrollExampleState extends State<ScrollExample> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      var tl = Gsap.timeline(TimeLineOptions(
              scrollTrigger: ScrollTriggerOptions(
                  trigger: '.container',
                  start: 'top center',
                  end: '+=400',
                  scrub: 1))

          /**{
        'scrollTrigger': {
          'trigger': '.container',
          'start':
              'top center', // when the top of the trigger hits the top of the viewport
          'end': '+=400', // end after scrolling 500px beyond the start
          'scrub':
              1, // smooth scrubbing, takes 1 second to "catch up" to the scrollbar
        },
      }**/

          );

// add animations and labels to the timeline
      tl.from('.box', {
        'backgroundColor': '#28a92b',
        'rotation': 360,
        'scale': 0,
      });
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      h1([Text("Scroll down 👇")]),
    ], classes: [
      'section_scroll'
    ]);
    yield div([
      div([], classes: ['box']),
    ], classes: [
      'section_scroll',
      'container'
    ]);
    yield div([], classes: ['section_scroll']);
  }
}
