import 'dart:html';

import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class ObserverExample extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => ObserverExampleState();
}

class ObserverExampleState extends State<ObserverExample> {
  late var sections,
      images,
      headings,
      outerWrappers,
      innerWrappers,
      wrap,
      animating = false,
      currentIndex;

  gotoSection(index, direction) {
    //index = wrap(index); // make sure it's valid
    animating = true;
    var fromTop = direction == -1,
        dFactor = fromTop ? -1 : 1,
        tl = Gsap.timeline(TimeLineOptions(
            defaults: {'duration': 1.25, 'ease': "power1.inOut"},
            onComplete: () => animating = false));
    if (currentIndex >= 0) {
      // The first time this function runs, current is -1
      Gsap.set(sections[currentIndex], {'zIndex': 0});
      tl.to(images[currentIndex], {'yPercent': -15 * dFactor}).set(
          sections[currentIndex], {'autoAlpha': 0});
    }
    Gsap.set(sections[index], {'autoAlpha': 1, 'zIndex': 1});
    tl.fromTo([
      outerWrappers[index],
      innerWrappers[index]
    ], {
      'yPercent': currentIndex >= index ? -100 * dFactor : 100 * dFactor
    }, {
      'yPercent': 0
    }).fromTo(images[index], {'yPercent': 15 * dFactor}, {'yPercent': 0})
        /** can't do this because I don't have split text plugin
     * .fromTo(splitHeadings[index].chars, { 
        'autoAlpha': 0, 
        'yPercent': 150 * dFactor
    }, {
        'autoAlpha': 1,
        'yPercent': 0,
        'duration': 1,
        'ease': "power2",
        'stagger': {
          'each': 0.02,
          'from': "random"
        }
      }, 0.2)**/
        ;

    currentIndex = index;
  }

  void onDown(Observer observer) {
    if (!animating) gotoSection(currentIndex - 1, -1);
  }

  void onUp(Observer observer) {
    if (!animating) gotoSection(currentIndex + 1, 1);
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      sections = document.querySelectorAll("section");
      images = document.querySelectorAll(".bg");
      headings = GsapUtils.toArray(".section-heading");
      outerWrappers = GsapUtils.toArray(".outer");
      innerWrappers = GsapUtils.toArray(".inner");
      // can't do this because I don't have split text plugin
      //splitHeadings = headings.map(heading => new SplitText(heading, { type: "chars,words,lines", linesClass: "clip-text" })),
      currentIndex = -1;
      wrap = GsapUtils.wrap(sections);

      Gsap.set(outerWrappers, {'yPercent': 100});
      Gsap.set(innerWrappers, {'yPercent': -100});

      Observer.create(ObserverOptions(
          type: "wheel,touch,pointer",
          wheelSpeed: -1,
          onDown: onDown,
          onUp: onUp,
          tolerance: 10,
          preventDefault: true));

      gotoSection(0, 1);
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      div([
        div([
          div([
            h2([Text('Scroll down')],
                classes: ['section-heading', 'h2-observer'])
          ], classes: [
            'bg',
            'one'
          ])
        ], classes: [
          'inner'
        ])
      ], classes: [
        'outer'
      ])
    ], classes: [
      'section-observer',
      'first'
    ]);
    yield section([
      div([
        div([
          div([
            h2([Text('Animated with GSAP')],
                classes: ['section-heading', 'h2-observer'])
          ], classes: [
            'bg'
          ])
        ], classes: [
          'inner'
        ])
      ], classes: [
        'outer'
      ])
    ], classes: [
      'section-observer',
      'second'
    ]);
    yield section([
      div([
        div([
          div([
            h2([Text('GreenSock')], classes: ['section-heading', 'h2-observer'])
          ], classes: [
            'bg'
          ])
        ], classes: [
          'inner'
        ])
      ], classes: [
        'outer'
      ])
    ], classes: [
      'section-observer',
      'third'
    ]);
    yield section([
      div([
        div([
          div([
            h2([Text('Animation platform')],
                classes: ['section-heading', 'h2-observer'])
          ], classes: [
            'bg'
          ])
        ], classes: [
          'inner'
        ])
      ], classes: [
        'outer'
      ])
    ], classes: [
      'section-observer',
      'fourth'
    ]);
    yield section([
      div([
        div([
          div([
            h2([Text('Keep scrolling')],
                classes: ['section-heading', "h2-observer"])
          ], classes: [
            'bg'
          ])
        ], classes: [
          'inner'
        ])
      ], classes: [
        'outer'
      ])
    ], classes: [
      'section-observer',
      'fifth'
    ]);
  }
}
