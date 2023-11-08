import 'dart:html';

import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class GsapTest extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //yield TestGsapEffects();
    yield TestGsapVersion();
    yield TestGsapDelayedCall();
    yield Text("---- Test Gsap Export ----");
    yield TestGsapExportRoot();
    yield Text("---- Test Gsap To ----");
    yield TestGsapTo();
    yield Text("---- Test Gsap FromTo ----");
    yield TestGsapFromTo();
    yield Text("---- Test Gsap getById----");
    yield TestGsapGetById();
    yield Text("---- Test Gsap get property---");
    yield TestGsapGetProperty();
    yield Text("---- Test Gsap get tweens of---");
    yield TestGsapGetTweensOf();
    yield Text("---- Test Gsap match media---");
    yield TestGsapMatchMedia();
    yield Text("---- Test Gsap parse ease---");
    yield TestGsapParseEase();
    yield Text("---- Test Gsap quick setter---");
    //yield TestGsapQuickSetter();
    yield Text("---- Test Gsap quick to---");
    // yield TestGsapQuickTo();
    yield Text("---- Test Gsap registerEase ---");
    yield TestGsapRegisterEase();
  }
}

class TestGsapEffects extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapEffectsState();
}

class TestGsapEffectsState extends State<TestGsapEffects> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //TODO Gsap.registerEffet()
    yield (div(
        id: 'demo',
        [
          h2([Text("GSAP 3 Effects Simple Demo")]),
          div(
            [],
            classes: ['box green'],
          ),
          div([], classes: ['box grey']),
          div([], classes: ['box orange']),
          div([], classes: ['box green']),
          div([], classes: ['box grey']),
          div([], classes: ['box orange']),
          div([], classes: ['box green']),
          div([], classes: ['box grey']),
        ],
        styles: Styles.box(
            display: Display.inlineBlock,
            position: Position.relative(),
            height: Unit.percent(100))));
  }
}

class TestGsapVersion extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapVersionState();
}

class TestGsapVersionState extends State<TestGsapVersion> {
  String version = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      events: {
        'click': (e) => setState(() {
              version = Gsap.version();
            })
      },
      [],
      id: 'test_version_0',
    );
    yield Text(version.toString());
  }
}

class TestGsapDelayedCall extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapDelayedCallState();
}

class TestGsapDelayedCallState extends State<TestGsapDelayedCall> {
  String output = "";

  myFunction(param1, param2) {
    setState(() {
      output = "Received $param1 $param2";
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      events: {
        'click': (e) => setState(() {
              Gsap.delayedCall(1, myFunction, parameters: ["param1", "param2"]);
            })
      },
      [],
      id: 'test_delayedCall_0',
    );
    yield button(
      events: {
        'click': (e) => setState(() {
              var tween = Gsap.delayedCall(1, myFunction,
                  parameters: ["param1", "param2"]);
              tween.kill();
            })
      },
      [],
      id: 'test_delayedCall_1',
    );
    yield Text(output);
  }
}

class TestGsapExportRoot extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapExportRootState();
}

class TestGsapExportRootState extends State<TestGsapExportRoot> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      events: {
        'click': (e) => setState(() {
              var tl = Gsap.exportRoot();
              Gsap.to(tl, {'duration': 0.5, 'timeScale': 0});
            })
      },
      [],
      id: 'test_exportRoot_0',
    );

    yield Text(output);
  }
}

class TestGsapTo extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapToState();
}

class TestGsapToState extends State<TestGsapTo> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([], classes: ["box", "green"]);
    yield div([], classes: ["box", "orange"]);
    yield div([], classes: ["box", "grey"]);
    yield button(
      events: {
        'click': (e) => setState(() {
              Gsap.from(".box", {'opacity': 0, 'y': 100, 'duration': 1});
            })
      },
      [],
      id: 'test_to_0',
    );

    yield Text(output);
  }
}

class TestGsapFromTo extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapFromToState();
}

class TestGsapFromToState extends State<TestGsapFromTo> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([], classes: ["box", "green"]);
    yield div([], classes: ["box", "orange"]);
    yield div([], classes: ["box", "grey"]);
    yield button(
      events: {
        'click': (e) => setState(() {
              Gsap.fromTo(
                  ".box", {'autoAlpha': 0}, {'autoAlpha': 0.5, 'duration': 1});
            })
      },
      [],
      id: 'test_fromTo_0',
    );

    yield Text(output);
  }
}

class TestGsapGetById extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapGetByIdState();
}

class TestGsapGetByIdState extends State<TestGsapGetById> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([], classes: ["box", "green"]);
    yield div([], classes: ["box", "orange"]);
    yield div([], classes: ["box", "grey"]);
    yield button(
      events: {
        'click': (e) => setState(() {
              Gsap.to(".box", {'id': "myTween", 'duration': 1, 'x': 100});

//later
              Tween tween = Gsap.getById("myTween"); //returns the tween
              tween.pause();
              //setState(() {tween.});
            })
      },
      [],
      id: 'test_getById_0',
    );

    yield Text(output);
  }
}

class TestGsapGetProperty extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapGetPropertyState();
}

class TestGsapGetPropertyState extends State<TestGsapGetProperty> {
  num output = -1;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([], classes: ["box", "green"], id: "box");
    //expect 50
    yield button(
      events: {
        'click': (e) => setState(() {
              var value = Gsap.getProperty("#box", "width");
              output = value;
//later
            })
      },
      [],
      id: 'test_getProperty_0',
    );

    yield Text(output.toString());
  }
}

class TestGsapGetTweensOf extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapGetTweensOfState();
}

class TestGsapGetTweensOfState extends State<TestGsapGetTweensOf> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([], classes: ["test"]);
    yield div([], classes: ["test2"]);
    //expect 50
    yield button(
      events: {
        'click': (e) => setState(() {
              Gsap.to('.test', {'x': 100});
              Gsap.to('.test2', {'x': 100});
              Gsap.to(['.test', '.test2'], {'opacity': 0});

              List<Tween> a1 = Gsap.getTweensOf('.test'); //finds 2 tweens
              List<Tween> a2 = Gsap.getTweensOf(['.test', '.test2']);
              output = "${a1.length} ${a2.length}";
//later
            })
      },
      [],
      id: 'test_getTweensOf_0',
    );

    yield Text(output);
  }
}

class TestGsapMatchMedia extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapMatchMediaState();
}

class TestGsapMatchMediaState extends State<TestGsapMatchMedia> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //expect 50
    yield button(
      events: {
        'click': (e) => setState(() {
              var mm = Gsap.matchMedia();
              var breakPoint = 800;
              var ctx = Gsap.context();
              mm.add({
                // set up any number of arbitrarily-named conditions. The function below will be called when ANY of them match.
                'isDesktop': '(min-width: $breakPoint px)',
                'isMobile': '(max-width: ${breakPoint - 1}px)',
                'reduceMotion': "(prefers-reduced-motion: reduce)",
              }, (Context context) {
                // context.conditions has a boolean property for each condition defined above indicating if it's matched or not.
                var conditions = context.conditions;

                Gsap.to(".box", {'rotation': 360});
                //  'rotation': isDesktop ? 360 : 180, // spin further if desktop
                //  'duration': reduceMotion ? 0 : 2, // skip to the end if prefers-reduced-motion
                //});
              });

//later
            })
      },
      [],
      id: 'test_match_media_0',
    );

    yield Text(output);
  }
}

class TestGsapParseEase extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapParseEaseState();
}

class TestGsapParseEaseState extends State<TestGsapParseEase> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //expect 50
    yield button(
      events: {
        'click': (e) => setState(() {
              var ease = Gsap.parseEase("power1");
              var step = Gsap.parseEase("steps(5)");
              var elastic = Gsap.parseEase("elastic(1.2, 0.5)");
//later
            })
      },
      [],
      id: 'test_getTweensOf_0',
    );

    yield Text(output);
  }
}

class TestGsapQuickSetter extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapQuickSetterState();
}

class TestGsapQuickSetterState extends State<TestGsapQuickSetter> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Future.delayed(Duration(milliseconds: 500), () {
      Gsap.set(".flair", {'xPercent': -50, 'yPercent': -50});

      var xSetter = Gsap.quickSetter(".flair", "x",
          "px"); //apply it to the #id element's x property and append a "px" unit
      var ySetter = Gsap.quickSetter(".flair", "y",
          "px"); //apply it to the #id element's x property and append a "px" unit

      window.onMouseMove.listen(
        (event) {
          xSetter(event.offset.x);

          ySetter(event.offset.y);
        },
      );
    });

    yield div([], classes: ["flair", "flair--3"]);
    //expect 50
  }
}

class TestGsapQuickTo extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapQuickToState();
}

class TestGsapQuickToState extends State<TestGsapQuickTo> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Future.delayed(Duration(milliseconds: 500), () {
      Gsap.set(".flair", {'xPercent': -50, 'yPercent': -50});

      var xTo =
          Gsap.quickTo(".flair", "x", {'duration': 0.6, 'ease': "power3"});
      var yTo =
          Gsap.quickTo(".flair", "y", {'duration': 0.6, 'ease': "power3"});

      window.onMouseMove.listen(
        (event) {
          xTo(event.offset.x);

          yTo(event.offset.y);
        },
      );
    });

    yield div([], classes: ["flair", "flair--3"]);
    //expect 50
  }
}

class TestGsapRegisterEase extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapRegisterEaseState();
}

class TestGsapRegisterEaseState extends State<TestGsapRegisterEase> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        Gsap.registerEase("myEaseName", (progress) {
          return progress; //linear
        });

//now we can apply the ease in any tween like:
        Gsap.to("#register_ease", {'x': 100, 'ease': "myEaseName"});
      },
    );

    yield div([], id: "register_ease");
    //expect 50
  }
}
/** 
class TestGsapRegisterEffect extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapRegisterEffectState();
}

class TestGsapRegisterEffectState extends State<TestGsapRegisterEffect> {
  String output = "";

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        Gsap.registerEffect(RegisterEffectOption(
            name: "fade",
            effect: (targets, config) {
              return Gsap.to(
                  targets, {"duration": config.duration, 'opacity': 0});
            },
            defaults: {'duration': 2},
            extendTimeline: true));
      },
    );

    yield div([],
        id: "register_effect",
        styles: Styles.box(width: Unit.pixels(500), height: Unit.pixels(500)));
    //expect 50
  }
}*/
