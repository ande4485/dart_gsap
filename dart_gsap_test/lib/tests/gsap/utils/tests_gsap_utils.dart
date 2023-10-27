import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class GsapUtilsTest extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield GsapUtilsClampText();
    yield GsapUtilsInterpolate();
    yield GsapUtilsGetUnit();
    yield GsapUtilsMapRange();
    yield GsapUtilsNormalize();
    yield GsapUtilsRandom();
    yield GsapUtilsShuffle();
    yield GsapUtilsSnap();
    yield GsapUtilsSplitColor();
    yield GsapUtilsToArray();
    yield GsapUtilsUnitize();
  }
}

class GsapUtilsClampText extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsClampTestState();
}

class GsapUtilsClampTestState extends State<GsapUtilsClampText> {
  num value = -1;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 100
    yield button(
      events: {
        'click': (e) => setState(() {
              Function fun = GsapUtils.clamp(0, 100);
              value = fun(105);
            })
      },
      [],
      id: 'test_clamp_0',
    );
    //return result 0
    yield button(
      events: {
        'click': (e) => setState(() {
              Function fun = GsapUtils.clamp(0, 100);
              value = fun(-50);
            }),
      },
      [],
      id: 'test_clamp_1',
    );
    //expect 20
    yield button(
      events: {
        'click': (e) {
          setState(() {
            Function fun = GsapUtils.clamp(0, 100);
            value = fun(20);
          });
        }
      },
      [],
      id: 'test_clamp_2',
    );
    yield Text(value.toString());
  }
}

class GsapUtilsGetUnit extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsGetUnitState();
}

class GsapUtilsGetUnitState extends State<GsapUtilsGetUnit> {
  String value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = "vw"
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.getUnit("100vw");
            })
      },
      [],
      id: 'test_get_unit_0',
    );
    yield Text(value.toString());
  }
}

class GsapUtilsInterpolate extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsInterpolateState();
}

class GsapUtilsInterpolateState extends State<GsapUtilsInterpolate> {
  late dynamic value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 250
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.interpolate(0, 500, 0.5);
            })
      },
      [],
      id: 'test_interpolate_0',
    );
    //return "30px"
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.interpolate("20px", "40px", 0.5);
            })
      },
      [],
      id: 'test_interpolate_1',
    );
    //return "rgba(128,0,128,1)"
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.interpolate("red", "blue", 0.5);
            })
      },
      [],
      id: 'test_interpolate_2',
    );
    // return {a: 50, b: 15, c: "rgba(128,0,128,1)"}
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.interpolate({'a': 0, 'b': 10, 'c': "red"},
                  {'a': 100, 'b': 20, 'c': "blue"}, 0.5);
            })
      },
      [],
      id: 'test_interpolate_3',
    );
    yield Text(value.toString());
  }
}

class GsapUtilsMapRange extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsMapRangeState();
}

class GsapUtilsMapRangeState extends State<GsapUtilsMapRange> {
  num value = -1;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 150
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.mapRange(-10, 10, 100, 200, 0);
            })
      },
      [],
      id: 'test_maprange_0',
    );
    //return 250
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.mapRange(0, 100, 0, 500, 50);
            })
      },
      [],
      id: 'test_maprange_1',
    );
    yield Text(value.toString());
  }
}

class GsapUtilsNormalize extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsNormalizeState();
}

class GsapUtilsNormalizeState extends State<GsapUtilsNormalize> {
  num value = -1;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 150
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.normalize(-10, 10, 0);
            })
      },
      [],
      id: 'test_normalize_0',
    );
    //return 250
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.normalize(0, 100, 25);
            })
      },
      [],
      id: 'test_normalize_1',
    );
    yield Text(value.toString());
  }
}

class GsapUtilsRandom extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsRandomState();
}

class GsapUtilsRandomState extends State<GsapUtilsRandom> {
  num value = -1;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = "vw"
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.random(-100, 100);
            })
      },
      [],
      id: 'test_random_0',
    );
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.random(0, 500, snapIncrement: 5);
            })
      },
      [],
      id: 'test_random_1',
    );
    yield button(
      events: {
        'click': (e) => setState(() {
              var valueReturned = GsapUtils.random(-200, 500,
                  snapIncrement: 10, returnFunction: true);
              value = valueReturned();
            })
      },
      [],
      id: 'test_random_1',
    );
    yield Text(value.toString());
  }
}

class GsapUtilsShuffle extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsShuffleState();
}

class GsapUtilsShuffleState extends State<GsapUtilsShuffle> {
  List value = [];
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = "vw"
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.shuffle([1, 2, 3, 4, 5]);
            })
      },
      [],
      id: 'test_shulle_0',
    );

    yield Text(value.toString());
  }
}

class GsapUtilsSnap extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsSnapState();
}

class GsapUtilsSnapState extends State<GsapUtilsSnap> {
  num value = -1;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    //return result = 20
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.snap(10, 23.5);
            })
      },
      [],
      id: 'test_snap_0',
    );
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.snap(2, 9.3);
            })
      },
      [],
      id: 'test_snap_1',
    );

    yield Text(value.toString());
  }
}

class GsapUtilsSplitColor extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsSplitColorState();
}

class GsapUtilsSplitColorState extends State<GsapUtilsSplitColor> {
  List value = [];
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // [255, 0, 0]
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.splitColor("red");
            })
      },
      [],
      id: 'test_splitColor_0',
    );
    // [111, 185, 54]
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.splitColor("#6fb936");
            })
      },
      [],
      id: 'test_splitColor_1',
    );
    // [204, 153, 51, 0.5]
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.splitColor("rgba(204, 153, 51, 0.5)");
            })
      },
      [],
      id: 'test_splitColor_2',
    );

    // [94, 55, 47]
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.splitColor("#6fb936", returnHSL: true);
            })
      },
      [],
      id: 'test_splitColor_3',
    );

    yield Text(value.toString());
  }
}

class GsapUtilsToArray extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsToArrayState();
}

class GsapUtilsToArrayState extends State<GsapUtilsToArray> {
  List value = [];
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield (div([], classes: ["test"]));
    yield (div([], classes: ["test"]));
    yield button(
      events: {
        'click': (e) => setState(() {
              value = GsapUtils.toArray(".test");
            })
      },
      [],
      id: 'test_toArray_0',
    );
    // [111, 185, 54]

    yield Text(value.toString());
  }
}

class GsapUtilsUnitize extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => GsapUtilsUnitizeState();
}

class GsapUtilsUnitizeState extends State<GsapUtilsUnitize> {
  String value = "";
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      events: {
        'click': (e) => setState(() {
              Function result =
                  GsapUtils.unitize(GsapUtils.clamp(0, 100), unit: "px");
              value = result(132);
            })
      },
      [],
      id: 'test_unitize_0',
    );
    //Yellow
    /**  yield button(
      events: {
        'click': (e) => setState(() {
              Function result = GsapUtils.unitize(
                  GsapUtils.(["red", "green", "yellow"]));
              value = result(5);
            })
      },
      [],
      id: 'test_unitize_0',
    );*/
    // [111, 185, 54]

    yield Text(value.toString());
  }
}
