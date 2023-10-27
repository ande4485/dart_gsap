import 'package:js/js.dart';

@JS('Tween')
class JSTween {
  external JSTween delay(num time);
  external JSTween duration(num duration);
  external JSTween endTime(bool includeRepeats);
  external JSTween eventCallback(String type, Function callback, List? params);
  external num globalTime(num localTime);
  external JSTween invalidate();
  external bool isActive();
  external JSTween iteration(num iteration);
  external JSTween kill(Object? obj, String propertiesList);
  external JSTween pause(num? atTime, bool suppressEvents);
  external JSTween paused(bool value);
  external JSTween play(num? from, bool suppressEvents);
  external JSTween progress(num? value, bool suppressEvents);
  external JSTween repeat(num? value);
  external JSTween repeatDelay(num value);
  external JSTween restart(bool includeDelay, bool suppressEvents);
  external JSTween resume();
  external JSTween reverse(dynamic from, bool suppressEvents);
  external JSTween reversed(bool value);
  external JSTween revert();
  external JSTween seek(dynamic time, bool suppressEvents);
  external JSTween startTime(num value);
  external List targets();
  external JSTween then(Function callback);
  external JSTween time(num? value, bool suppressEvents);
  external JSTween timeScale(num value);
  external JSTween totalDuration(num value);
  external JSTween totalProgress(num value, bool suppressEvents);
  external JSTween totalTime(num? time, bool suppressEvents);
  external JSTween yoyo(bool value);
}
