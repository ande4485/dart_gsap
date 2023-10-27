import 'package:jaspr/html.dart';
import 'package:jaspr/jaspr.dart';

// A simple [StatelessComponent] with a [build] method
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // renders a <p> element with 'Hello World' content
    yield div(
      [],
      id: 'test_id',
    );
  }
}
