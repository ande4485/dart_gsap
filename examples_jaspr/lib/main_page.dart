import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class MainPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      [Text('Simple')],
      events: {'click': (e) => Router.of(context).push('/simple')},
    );
    yield button(
      [Text('Scroll')],
      events: {'click': (e) => Router.of(context).push('/scroll')},
    );
    yield button(
      [Text('ScrollTo')],
      events: {'click': (e) => Router.of(context).push('/scrollTo')},
    );
    yield button(
      [Text('Observer')],
      events: {'click': (e) => Router.of(context).push('/observer')},
    );
  }
}
