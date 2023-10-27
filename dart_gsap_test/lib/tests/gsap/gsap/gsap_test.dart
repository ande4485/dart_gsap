import 'package:dart_gsap/dart_gsap.dart';
import 'package:jaspr/html.dart';

class GsapTest extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield TestGsapEffects();
  }
}

class TestGsapEffects extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => TestGsapEffectsState();
}

class TestGsapEffectsState extends State<TestGsapEffects> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Gsap.registerEffet()
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
