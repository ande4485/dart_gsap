import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class TestTimeline extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield TestDelay();
    yield TestEndTime();
    //OK
    yield TestEventCallBack();
    // OK
    yield TestGetById();
    //TODO not return Timeline
    yield TestGetChildren();
    //is Active
    //TODO error when return returned() always a Tween
    yield TestIsActive();
    //iteration
    yield TestIteration();
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
        'click': (e) {
          TimeLine timeLine = Gsap.timeline();
          value = timeLine.delay;
          timeLine.delay = 20;
          setState(() {
            value = timeLine.delay;
          });
        }
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
        'click': (e) => setState(() {
              TimeLine timeLine = Gsap.timeline();
              var tween = Gsap.to('.div-test', {'duration': 1, 'x': 100});
              timeLine.add(tween, position: 0.5);
              var endTimeFirst = tween.endTime();
              tween.timeScale = 2;
              var endTimeSecond = tween.endTime();
              value = "$endTimeFirst $endTimeSecond";
            })
      },
      [],
      id: 'test_clamp_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestEventCallBack extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestEventCallBackState();
}

class TestEventCallBackState extends State<TestEventCallBack> {
  String value = "";
  late TimeLine timeLine;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      timeLine = Gsap.timeline();
      //var tween = Gsap
      //timeLine.add(tween);
      timeLine.to('.div-test', {'duration': 30, 'x': 100});
      timeLine.eventCallback("onComplete", callback: () {
        setState(() {
          value = 'onComplete';
        });
      });
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div([], classes: ['div-test']);
    yield button(
      events: {'click': (e) {}},
      [],
      id: 'test_clamp_0',
    );
    //return result 0

    yield Text(value.toString());
  }
}

class TestGetById extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGetByIdState();
}

class TestGetByIdState extends State<TestGetById> {
  String value = "";
  late TimeLine timeline;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      timeline = Gsap.timeline();

//give the animation a "myTween" id upon creation
      timeline.to('.div-test', {'id': "myTween", 'duration': 1, 'x': 100});
    });

    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div([], classes: ['div-test']);
    yield button(
      events: {
        'click': (e) {
//later we can get it like this
          TimeLine myTween = timeline.getById("myTween");
          setState(() {
            value = myTween.delay.toString();
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
              Gsap.timeline(TimeLineOptions(defaults: {'duration': 1}));
          var nested = Gsap.timeline();

//drop 2 tweens into the nested timeline

          nested.to("#e1", {'duration': 1, 'x': 100}).to(
              "#e2", {'duration': 2, 'y': 200});

//drop 3 tweens into the master timeline
          master.to("#e3", {'top': 200}).to("#e4", {'left': 100}).to(
              "#e5", {'backgroundColor': "red"});

          master.add(nested);
//nest the timeline:

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
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100

    Future.delayed(Duration(milliseconds: 500), () {
      var endX = 300;
      tween =
          Gsap.to(".box", {'duration': 2, 'x': endX, 'ease': "none"}).reverse();
    });

    yield div([
      div([], classes: ['box', "green"])
    ], classes: [
      'wrapper'
    ]);

    yield button(
      events: {
        'click': (e) {
          var res;
          if (!tween.isActive()) {
            print(tween.isActive());
            //only reverse the direction if the tween is not active

            //tween.reversed(!tween.reversed());
          }
          setState(() {
            value = res.toString();
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

class TestIteration extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestIterationState();
}

class TestIterationState extends State<TestIteration> {
  String value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield div(
      [],
    );

    yield button(
      events: {
        'click': (e) {
          TimeLine tl = Gsap.timeline();
          var tlIt = tl.iteration;
          tl.iteration = 2;

          setState(() {
            value = "$tlIt ${tl.iteration}";
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
