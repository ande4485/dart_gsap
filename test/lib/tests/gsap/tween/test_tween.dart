import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class TestTween extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //GOOD
    yield TestDelay();
    //GOOD
    yield TestDuration();

    //GOOD
    yield TestEndTime();

    //GOOD
    yield TestGlobalTime();

    //GOOD
    yield TestInvalidate();
    //GOOD
    yield TestIsActive();

    yield TestIteration();

    yield TestYoyo();
  }
}

class TestDelay extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestDelayState();
}

class TestDelayState extends State<TestDelay> {
  num value = -1;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield button(
      events: {
        'click': (e) => setState(() {
              Tween timeLine = Gsap.to(".box", {});
              value = timeLine.delay;
              timeLine.delay = 20;
              value = timeLine.delay;
            })
      },
      [],
      id: 'test_clamp_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestDuration extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestDurationState();
}

class TestDurationState extends State<TestDuration> {
  late Tween timeline;
  String value = "";
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      timeline = Gsap.to(".div-test", {});
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div([], classes: ['div-test']);
    yield button(
      events: {
        'click': (e) => setState(() {
              //value = timeLine.duration();
              timeline.duration = 20;
              value = timeline.duration.toString();
            })
      },
      [],
      id: 'test_clamp_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestEndTime extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestEndTimeState();
}

class TestEndTimeState extends State<TestEndTime> {
  String value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div([], classes: ['div-test']);
    yield button(
      events: {
        'click': (e) {
          var tl = Gsap.timeline();

//create a 1-second tween
          var tween = Gsap.to('div-test', {'duration': 1, 'x': 100});

//insert the tween at 0.5 seconds into the timeline
          tl.add(tween, position: 0.5);

          print(tween.endTime()); //1.5

//double the speed of the tween, thus it'll finish in half the normal time
          tween.timeScale = 2;

          print(tween.endTime()); //1
        }
      },
      [],
      id: 'test_clamp_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestGlobalTime extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGlobalTimeState();
}

class TestGlobalTimeState extends State<TestGlobalTime> {
  String value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div([], classes: ['div-test']);
    yield button(
      events: {
        'click': (e) {
//give the animation a "myTween" id upon creation
          Tween tween =
              Gsap.to('.div-test', {'id': "myTween", 'duration': 1, 'x': 100});

//later we can get it like this

          setState(() {
            value = tween.globalTime(80).toString();
          });
        }
      },
      [],
      id: 'test_getById_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestGetChildren extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGetChildrenState();
}

class TestGetChildrenState extends State<TestGetChildren> {
  String value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div([], id: 'e1');
    yield div([], id: 'e2');
    yield div([], id: 'e3');
    yield div([], id: 'e4');
    yield div([], id: 'e5');
    yield button(
      events: {
        'click': (e) {
          var master =
                  Gsap.timeline(TimeLineOptions(defaults: {'duration': 1})),
              nested = Gsap.timeline();

//drop 2 tweens into the nested timeline
          nested.to("#e1", {'duration': 1, 'x': 100}).to(
              "#e2", {'duration': 2, 'y': 200});

//drop 3 tweens into the master timeline
          master.to("#e3", {'top': 200}).to("#e4", {'left': 100}).to(
              "#e5", {'backgroundColor': "red"});

//nest the timeline:
          master.add(nested);

//get only the direct children of the master timeline:
          var children1 =
              master.getChildren(nested: false, tweens: true, timelines: true);

//"3" (2 tweens and 1 timeline)

//get all of the tweens/timelines (including nested ones) that occur AFTER 0.5 seconds
          var children2 = master.getChildren(
              nested: true,
              tweens: true,
              timelines: true,
              ignoreBeforeTime: 0.5);

//"5" (4 tweens and 1 timeline)

//get only tweens (not timelines) of master (including nested tweens):
          var children3 =
              master.getChildren(nested: true, tweens: true, timelines: false);

//"5" (5 tweens)
          setState(() {
            value =
                "${children1.length} ${children2.length} ${children3.length}";
          });
        }
      },
      [],
      id: 'test_getChildren_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestIsActive extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestIsActiveState();
}

class TestIsActiveState extends State<TestIsActive> {
  String value = "";
  late Tween tween;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      var endX = 300;
      tween =
          Gsap.to(".box-isactive", {'duration': 2, 'x': endX, 'ease': "none"})
              .reverse();
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100

    yield div([
      div([], classes: ['box-isactive'])
    ], classes: [
      'wrapper'
    ]);

    yield button(
      events: {
        'click': (e) {
          var res;
          print(tween.isActive());
          if (!tween.isActive()) {
            //only reverse the direction if the tween is not active
            var value = !tween.reversed;
            print(value);
            tween.reversed = value;
          }
          // setState(() {
          //   value = res.toString();
          // });
        }
      },
      [],
      id: 'test_getById_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestIteration extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestIterationState();
}

class TestIterationState extends State<TestIteration> {
  String value = "";
  late Tween tween;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      var endX = 300;
      tween = Gsap.to(".box", {'duration': 2, 'x': endX, 'ease': "none"});
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div(
      [],
    );

    yield button(
      events: {
        'click': (e) {
          var tlIt = tween.iteration;
          tween.iteration = 2;

          setState(() {
            value = "$tlIt ${tween.iteration}";
          });
        }
      },
      [],
      id: 'test_getById_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestInvalidate extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestInvalidateState();
}

class TestInvalidateState extends State<TestInvalidate> {
  String value = "";
  late Tween t;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Future.delayed(Duration(milliseconds: 200), () {
      t = Gsap.to(".green", {'duration': 1, 'x': "+=100"});
    });
    yield div([], classes: ['box', 'green']);

    yield button(
      events: {
        'click': (e) {
          t.restart();
        }
      },
      [],
      id: 'test_getById_0',
    );
    yield button(
      events: {
        'click': (e) {
          t.invalidate();
          t.restart();
        }
      },
      [],
      id: 'test_getById_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestYoyo extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestYoyoState();
}

class TestYoyoState extends State<TestYoyo> {
  String value = "";
  late Tween tween;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      var endX = 300;
      tween =
          Gsap.to(".box", {'duration': 1, 'x': 100, 'repeat': 1, 'yoyo': true});
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div(
      [],
    );

    yield button(
      events: {
        'click': (e) {
          var tlIt = tween.yoyo;
          tween.yoyo = false;

          setState(() {
            value = "$tlIt ${tween.yoyo}";
          });
        }
      },
      [],
      id: 'test_getById_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}
