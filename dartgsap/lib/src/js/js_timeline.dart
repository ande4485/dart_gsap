import 'package:dart_gsap/src/js/js_tween.dart';
import 'package:js/js.dart';

@JS('gsap.timeline')
class JSTimeline {
  external factory JSTimeline(args);
  external JSTimeline add(dynamic child, dynamic position);
  external JSTimeline addLabel(String label, dynamic position);
  external JSTimeline addPause(
      dynamic position, Function? callback, List? params);
  external JSTimeline call(Function callback, List? params, dynamic position);
  external JSTimeline clear(bool labels);
  external dynamic currentLabel(String? value);
  external JSTimeline delay(num? time);
  external JSTimeline duration(num? duration);
  external JSTimeline endTime(bool includeRepeats);
  external JSTimeline eventCallback(
      String type, Function? callback, List? params);
  external JSTimeline from(dynamic target, dynamic vars, dynamic position);
  external JSTimeline fromTo(
      dynamic target, dynamic fromVars, dynamic toVars, dynamic position);
  external dynamic getById(String id);
  external List getChildren(
      bool nested, bool tweens, bool timelines, num? ignoreBeforeTime);
  external List getTweensOf(dynamic target, bool nested);
  external num globalTime(num localTime);
  external JSTimeline invalidate();
  external bool isActive();
  external dynamic iteration(num? iteration);
  external JSTimeline kill();
  external JSTimeline killTweensOf(
      dynamic targets, String props, bool onlyActive);
  external String nextLabel(num time);
  external JSTimeline pause(num? atTime, bool suppressEvents);
  external dynamic paused(bool? value);

  external JSTimeline play(num? from, bool suppressEvents);
  external String previousLabel(num time);
  external dynamic progress(num? value, bool suppressEvents);
  external dynamic recent();
  external JSTimeline remove(dynamic value);
  external JSTimeline removeLabel(String label);
  external JSTimeline removePause(dynamic pause);
  external dynamic repeat(num value);
  external dynamic repeatDelay(num value);
  external JSTimeline restart(bool includeDelay, bool suppressEvents);
  external JSTimeline resume();
  external JSTimeline reverse(dynamic from, bool suppressEvents);
  external bool reversed(bool value);
  external JSTimeline revert();
  external JSTimeline seek(dynamic time, bool suppressEvents);
  external JSTimeline set(dynamic target, dynamic vars, dynamic position);
  external JSTimeline shiftChildren(
      num amount, bool adjustLabels, num ignoreBeforeTime);

  external dynamic startTime(num? value);

  external dynamic then(Function callback);
  external dynamic time(num? value, bool suppressEvents);
  external dynamic timeScale(num? value);
  external JSTimeline to(dynamic target, dynamic vars, dynamic position);
  external num totalDuration(num? value);
  external num totalProgress(num? value, bool suppressEvents);
  external num totalTime(num? time, bool suppressEvents);
  external JSTween tweenFromTo(
      dynamic fromPosition, dynamic toPosition, dynamic vars);
  external JSTween tweenTo(dynamic position, dynamic vars);
  external bool yoyo(bool value);
}
