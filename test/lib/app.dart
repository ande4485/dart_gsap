import 'package:dart_gsap_test/tests/gsap/gsap/gsap_test.dart';
import 'package:dart_gsap_test/tests/gsap/timeline/test_timeline.dart';
import 'package:dart_gsap_test/tests/gsap/tween/test_tween.dart';
import 'package:dart_gsap_test/tests/gsap/utils/tests_gsap_utils.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr/jaspr.dart';

// A simple [StatelessComponent] with a [build] method
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // renders a <p> element with 'Hello World' content
    yield GsapTest();
    yield GsapUtilsTest();
    yield TestTimeline();
    yield TestTween();
  }
}
