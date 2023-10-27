import 'package:dart_gsap/src/js/js_tween.dart';

class Tween {
  final JSTween jsTween;

  Tween(this.jsTween);

  Tween delay(num time) => Tween(jsTween.delay(time));

  Tween duration(num duration) => Tween(jsTween.duration(duration));
  Tween endTime(bool includeRepeats) => Tween(jsTween.endTime(includeRepeats));
  Tween eventCallback(String type, Function callback, List? params) =>
      Tween(jsTween.eventCallback(type, callback, params));
  num globalTime(num localTime) => jsTween.globalTime(localTime);
  Tween invalidate() => Tween(jsTween.invalidate());
  bool isActive() => jsTween.isActive();
  Tween iteration(num iteration) => Tween(jsTween.iteration(iteration));
  Tween kill({Object? obj, String propertiesList = "all"}) =>
      Tween(jsTween.kill(obj, propertiesList));
  Tween pause({int? atTime, bool suppressEvents = true}) =>
      Tween(jsTween.pause(atTime, suppressEvents));
  Tween paused(bool value) => Tween(jsTween.paused(value));
  Tween play({num? from, bool suppressEvents = true}) =>
      Tween(jsTween.play(from, suppressEvents));
  Tween progress(num? value, {bool suppressEvents = true}) =>
      Tween(jsTween.progress(value, suppressEvents));
  Tween repeat({num? value}) => Tween(jsTween.repeat(value));
  Tween repeatDelay(num value) => Tween(jsTween.repeatDelay(value));
  Tween restart({bool includeDelay = false, bool suppressEvents = true}) =>
      Tween(jsTween.restart(includeDelay, suppressEvents));
  Tween resume() => Tween(jsTween.resume());
  Tween reverse({dynamic from, bool suppressEvents = true}) =>
      Tween(jsTween.reverse(from, suppressEvents));
  Tween reversed(bool value) => Tween(jsTween.reversed(value));
  Tween revert() => Tween(jsTween.revert());
  Tween seek(dynamic time, {bool suppressEvents = true}) =>
      Tween(jsTween.seek(time, suppressEvents));
  Tween startTime(num value) => Tween(jsTween.startTime(value));
  List targets() => jsTween.targets();
  Tween then(Function callback) => Tween(jsTween.then(callback));
  Tween time(int? value, {bool suppressEvents = true}) =>
      Tween(jsTween.time(value, suppressEvents));
  Tween timeScale(num value) => Tween(jsTween.timeScale(value));
  Tween totalDuration(num value) => Tween(jsTween.totalDuration(value));
  Tween totalProgress(num value, {bool suppressEvents = true}) =>
      Tween(jsTween.totalProgress(value, suppressEvents));
  Tween totalTime(num time, {bool suppressEvents = true}) =>
      Tween(jsTween.totalTime(time, suppressEvents));
  Tween yoyo(bool value) => Tween(jsTween.yoyo(value));
}
