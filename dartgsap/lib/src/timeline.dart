import 'package:dart_gsap/src/js/js_timeline.dart';
import 'package:dart_gsap/src/js/js_tween.dart';
import 'package:dart_gsap/src/tween.dart';

import 'package:js/js_util.dart';

class TimeLine {
  JSTimeline timeline;

  TimeLine(this.timeline);

  TimeLine add(dynamic child, {dynamic position = "+=0"}) =>
      TimeLine(timeline.add(child, position));

  TimeLine addLabel(String label, {dynamic position = "+=0"}) =>
      TimeLine(timeline.addLabel(label, position));

  TimeLine addPause(
          {dynamic position = "+=0", Function? callback, List? params}) =>
      TimeLine(timeline.addPause(position,
          callback == null ? callback : allowInterop(callback), params));

  TimeLine call(Function callback, List? params, {dynamic position = "+=0"}) =>
      TimeLine(timeline.call(allowInterop(callback), params, position));

  TimeLine clear(bool labels) => TimeLine(timeline.clear(labels));

  dynamic currentLabel({String? value}) {
    var returnValue = timeline.currentLabel(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  dynamic delay({int? time}) {
    var returnValue = timeline.delay(time);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  dynamic duration({int? duration}) {
    var returnValue = timeline.duration(duration);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  JSTimeline endTime({bool includeRepeats = true}) =>
      timeline.endTime(includeRepeats);

  dynamic eventCallback(String type, Function? callback, List? params) {
    var returnValue;
    if (callback != null) {
      returnValue =
          timeline.eventCallback(type, allowInterop(callback), params);
    } else {
      returnValue = timeline.eventCallback(type, callback, params);
    }

    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  TimeLine from(dynamic target, dynamic vars, {dynamic position = "+=0"}) =>
      TimeLine(timeline.from(target, vars, position));

  TimeLine fromTo(dynamic target, dynamic fromVars, dynamic toVars,
          {dynamic position = "+=0"}) =>
      TimeLine(timeline.fromTo(target, fromVars, toVars, position));

  dynamic getById(String id) {
    var returnResult = timeline.getById(id);
    if (returnResult is JSTimeline) {
      return TimeLine(returnResult);
    } else {
      return Tween(returnResult);
    }
  }

  List getChildren(
          {bool nested = true,
          bool tweens = true,
          bool timelines = true,
          int? ignoreBeforeTime}) =>
      timeline.getChildren(nested, tweens, timelines, ignoreBeforeTime);

  List getTweensOf(dynamic target, {bool nested = true}) =>
      timeline.getTweensOf(target, nested);

  num globalTime(num localTime) => timeline.globalTime(localTime);

  TimeLine invalidate() => TimeLine(timeline.invalidate());

  bool isActive() => timeline.isActive();

  dynamic iteration(int? iteration) {
    var returnValue = timeline.iteration(iteration);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  TimeLine kill() => TimeLine(timeline.kill());

  TimeLine killTweensOf(dynamic targets, String props, bool onlyActive) =>
      TimeLine(timeline.killTweensOf(targets, props, onlyActive));

  String nextLabel(int time) => timeline.nextLabel(time);

  TimeLine pause({int? atTime, bool suppressEvents = true}) =>
      TimeLine(timeline.pause(atTime, suppressEvents));

  dynamic paused({bool? value = false}) {
    var returnValue = timeline.paused(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  TimeLine play({int? from, bool suppressEvents = true}) =>
      TimeLine(timeline.play(from, suppressEvents));

  String previousLabel(int time) => timeline.previousLabel(time);

  dynamic progress({int? value, bool suppressEvents = false}) =>
      TimeLine(timeline.progress(value, suppressEvents));

  dynamic recent() {
    var returnResult = timeline.recent();
    if (returnResult is JSTimeline) {
      return TimeLine(returnResult);
    } else if (returnResult is JSTween) {
      return Tween(returnResult);
    } else {
      return returnResult;
    }
  }

  TimeLine remove(dynamic value) => TimeLine(timeline.remove(value));

  TimeLine removeLabel(String label) => TimeLine(timeline.removeLabel(label));

  TimeLine removePause(dynamic pause) => TimeLine(timeline.removePause(pause!));

  dynamic repeat({int value = 0}) {
    var returnValue = timeline.repeat(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  dynamic repeatDelay({int value = 0}) {
    var returnValue = timeline.repeatDelay(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  TimeLine restart({bool includeDelay = false, bool suppressEvents = true}) =>
      TimeLine(timeline.restart(includeDelay, suppressEvents));

  TimeLine resume() => TimeLine(timeline.resume());

  TimeLine reverse({dynamic from, bool suppressEvents = true}) =>
      TimeLine(timeline.reverse(from, suppressEvents));

  dynamic reversed({bool value = false}) {
    var returnValue = timeline.reversed(value);
    if (returnValue is JSTimeline) {
      return TimeLine(timeline);
    } else {
      return returnValue;
    }
  }

  TimeLine revert() => TimeLine(timeline.revert());

  TimeLine seek(dynamic time, {bool suppressEvents = true}) =>
      TimeLine(timeline.seek(time, suppressEvents));

  TimeLine set(dynamic target, dynamic vars, {dynamic position = "+=0"}) =>
      TimeLine(timeline.set(target, jsify(vars), position));

  TimeLine shiftChildren(int amount,
          {bool adjustLabels = false, int ignoreBeforeTime = 0}) =>
      TimeLine(timeline.shiftChildren(amount, adjustLabels, ignoreBeforeTime));

  dynamic startTime({int? value}) {
    var returnValue = timeline.startTime(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  Future then(Function callback) => timeline.then(callback);

  dynamic time(int? value, {bool suppressEvents = false}) {
    var returnValue = timeline.time(value, suppressEvents);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  dynamic timeScale(int? value) {
    var returnValue = timeline.timeScale(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  TimeLine to(dynamic target, dynamic vars, {dynamic position = "+=0"}) =>
      TimeLine(timeline.to(target, jsify(vars), position));

  num totalDuration(num? value) => timeline.totalDuration(value);

  num totalProgress(num? value, {bool suppressEvents = true}) =>
      timeline.totalProgress(value, suppressEvents);

  num totalTime(int? time, {bool suppressEvents = false}) =>
      timeline.totalTime(time, suppressEvents);

  // TODO vars
  Tween tweenFromTo(dynamic fromPosition, dynamic toPosition,
          {Map<String, dynamic>? vars}) =>
      Tween(timeline.tweenFromTo(fromPosition, toPosition, vars));

  //TODO vars
  Tween tweenTo(dynamic position, {dynamic vars}) =>
      Tween(timeline.tweenTo(position, vars));

  bool yoyo({bool value = false}) => timeline.yoyo(value);
}
