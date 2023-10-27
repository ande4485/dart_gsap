import 'package:js/js.dart';
export 'src/tween.dart';
export 'src/gsap.dart';
export 'src/timeline.dart';
export 'src/match_media.dart';
export 'src/gsap_utils.dart';

@JS()
@anonymous
class ScrollTriggerOptions {
  // Must have an unnamed factory constructor with named arguments.
  external factory ScrollTriggerOptions(
      {String trigger, String start, String end, String toggleActions});
}

@JS('ScrollTrigger')
class ScrollTrigger {
  external static Object create(ScrollTriggerCreateOptions obj);
}

@JS()
@anonymous
class ScrollTriggerCreateOptions {
  external factory ScrollTriggerCreateOptions(
      {String trigger,
      String pin,
      String start,
      String end,
      bool invalidateOnRefresh});
}
