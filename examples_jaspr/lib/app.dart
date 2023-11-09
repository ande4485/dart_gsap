import 'package:examples/main_page.dart';
import 'package:examples/observer/observer_example.dart';
import 'package:examples/scroll/scroll_example.dart';
import 'package:examples/scroll/scroll_to.dart';
import 'package:examples/simple/simple_example.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

// A simple [StatelessComponent] with a [build] method
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(routes: [
      Route(path: '/', name: 'main', builder: (context, state) => MainPage()),
      Route(
          path: '/simple',
          name: 'simple',
          builder: (context, state) => SimpleExample()),
      Route(
          path: '/scroll',
          name: 'scroll',
          builder: (context, state) => ScrollExample()),
      Route(
          path: '/scrollTo',
          name: 'scrollTo',
          builder: (context, state) => ScrollToExample()),
      Route(
          path: '/observer',
          name: 'observer',
          builder: (context, state) => ObserverExample()),
    ]);
  }
}
