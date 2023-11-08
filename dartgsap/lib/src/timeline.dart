import 'package:js/js_util.dart';

import '../dart_gsap.dart';
import 'js/js_gsap.dart';

class TimeLine {
  JSTimeline timeline;

  TimeLine(this.timeline);

  ///[override] Adds a tween, timeline,  or label (or an array of them) to the timeline.
  TimeLine add(dynamic child, {dynamic position = "+=0"}) =>
      TimeLine(timeline.add(child, position));

  ///Adds a label to the timeline, making it easy to mark important positions/times.
  TimeLine addLabel(String label, {dynamic position = "+=0"}) =>
      TimeLine(timeline.addLabel(label, position));

  ///Inserts a special callback that pauses playback of the timeline at a particular time or label.
  TimeLine addPause(
          {dynamic position = "+=0", Function? callback, List? params}) =>
      TimeLine(timeline.addPause(position,
          callback == null ? callback : allowInterop(callback), params));

  ///Adds a callback to the end of the timeline (or elsewhere using the position parameter) - this is a convenience method that accomplishes exactly the same thing as add( gsap.delayedCall(...) ) but with less code.
  TimeLine call(Function callback, List? params, {dynamic position = "+=0"}) =>
      TimeLine(timeline.call(allowInterop(callback), params, position));

  ///Empties the timeline of all tweens, timelines, and callbacks (and optionally labels too).
  TimeLine clear(bool labels) => TimeLine(timeline.clear(labels));

  ///Gets the closest label that is at or before the current time, or jumps to a provided label (behavior depends on whether or not you pass a parameter to the method).
  dynamic currentLabel({String? value}) {
    var returnValue = timeline.currentLabel(value);
    if (returnValue is JSTimeline) {
      return TimeLine(returnValue);
    } else {
      return returnValue;
    }
  }

  //// sets the animation's initial delay which is the length of time in seconds before the animation should begin.
  set delay(num time) => timeline.delay(time);

  ///Gets the animation's initial delay which is the length of time in seconds before the animation should begin.
  num get delay => timeline.delay();

  /// sets the animation's duration, not including any repeats or repeatDelays.
  set duration(num value) => timeline.duration(value);

  /// Gets  the animation's duration, not including any repeats or repeatDelays.
  num get duration => timeline.duration();

  /// Returns the time at which the animation will finish according to the parent timeline's local time.
  num endTime({bool includeRepeats = true}) => timeline.endTime(includeRepeats);

  ///Gets or sets an event callback like onComplete, onUpdate, onStart, onReverseComplete, or onRepeat along with any parameters that should be passed to that callback.
  TimeLine eventCallback(String type, {Function? callback, List? params}) =>
      TimeLine(timeline.eventCallback(
          type, callback != null ? allowInterop(callback) : callback, params));
  TimeLine from(dynamic target, Map<String, dynamic> vars,
          {dynamic position = "+=0"}) =>
      TimeLine(timeline.from(target, jsify(vars), position));

  /// Adds a .fromTo() tween to the end of the timeline - this is a convenience method that accomplishes exactly the same thing as add( gsap.fromTo(...) ) but with less code.
  TimeLine fromTo(dynamic target, dynamic fromVars, dynamic toVars,
          {dynamic position = "+=0"}) =>
      TimeLine(
          timeline.fromTo(target, jsify(fromVars), jsify(toVars), position));

  dynamic getById(String id) {
    var returnResult = timeline.getById(id);

    if (returnResult is JSTimeline) {
      return TimeLine(returnResult);
    } else {
      return Tween(returnResult);
    }
  }

  /// Returns an array containing all the tweens and/or timelines nested in this timeline.
  List getChildren(
          {bool nested = true,
          bool tweens = true,
          bool timelines = true,
          num ignoreBeforeTime = double.negativeInfinity}) =>
      timeline.getChildren(nested, tweens, timelines, ignoreBeforeTime);

  /// Returns the tweens of a particular object that are inside this timeline.
  List getTweensOf(dynamic target, {bool nested = true}) =>
      timeline.getTweensOf(target, nested);

  ///Converts a local time to the corresponding time on the gsap.globalTimeline (factoring in all nesting, timeScales, etc.).
  num globalTime(num localTime) => timeline.globalTime(localTime);

  /// [override] Flushes any internally-recorded starting/ending values which can be useful if you want to restart an animation without reverting to any previously recorded starting values.
  TimeLine invalidate() => TimeLine(timeline.invalidate());

  /// Indicates whether or not the animation is currently active (meaning the virtual playhead is actively moving across this instance's time span and it is not paused, nor are any of its ancestor timelines).
  bool isActive() => timeline.isActive();

  /// Gets the iteration (the current repeat) of tweens.
  num get iteration => timeline.iteration();

  /// sets the iteration (the current repeat) of tweens.
  set iteration(num iteration) => timeline.iteration(iteration);

  TimeLine kill() => TimeLine(timeline.kill());

  TimeLine killTweensOf(dynamic targets, String props, bool onlyActive) =>
      TimeLine(timeline.killTweensOf(targets, props, onlyActive));

  String nextLabel(int time) => timeline.nextLabel(time);

  TimeLine pause({int? atTime, bool suppressEvents = true}) =>
      TimeLine(timeline.pause(atTime, suppressEvents));

  /// sets the animation's paused state which indicates whether or not the animation is currently paused.
  set paused(bool value) => timeline.paused(value);

  ///Gets  the animation's paused state which indicates whether or not the animation is currently paused.
  bool get paused => timeline.paused();

  TimeLine play({num? from, bool suppressEvents = true}) =>
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

  ///sets the number of times that the tween should repeat after its first iteration.
  set repeat(num value) => timeline.repeat(value);

  ///Gets the number of times that the tween should repeat after its first iteration.
  num get repeat => timeline.repeat();

  /// sets the amount of time in seconds between repeats.
  set repeatDelay(num value) => timeline.repeatDelay(value);

  /// Gets the amount of time in seconds between repeats.
  num get repeatDelay => timeline.repeatDelay();

  TimeLine restart({bool includeDelay = false, bool suppressEvents = true}) =>
      TimeLine(timeline.restart(includeDelay, suppressEvents));

  TimeLine resume() => TimeLine(timeline.resume());

  TimeLine reverse([dynamic from, bool suppressEvents = true]) =>
      TimeLine(timeline.reverse(from, suppressEvents));

  /// sets the animation's reversed state which indicates whether or not the animation should be played backwards.
  set reversed(bool value) => timeline.reversed(value);

  ///Gets the animation's reversed state which indicates whether or not the animation should be played backwards.
  bool get reversed => timeline.reversed();

  TimeLine revert() => TimeLine(timeline.revert());

  TimeLine seek(dynamic time, {bool suppressEvents = true}) =>
      TimeLine(timeline.seek(time, suppressEvents));

  TimeLine set(dynamic target, dynamic vars, {dynamic position = "+=0"}) =>
      TimeLine(timeline.set(target, jsify(vars), position));

  TimeLine shiftChildren(int amount,
          {bool adjustLabels = false, int ignoreBeforeTime = 0}) =>
      TimeLine(timeline.shiftChildren(amount, adjustLabels, ignoreBeforeTime));

  ///sets the time at which the animation begins on its parent timeline (after any delay that was defined).
  set startTime(num value) => timeline.startTime(value);

  ///Gets  the time at which the animation begins on its parent timeline (after any delay that was defined).
  num get startTime => timeline.startTime();

  /// Returns a Function so that you can uses function to track when a tween or timeline is complete.
  Future then(Function callback) => timeline.then(callback);

  ///Gets or sets the local position of the playhead (essentially the current time), not including any repeats or repeatDelays.
  TimeLine time(int? value, {bool suppressEvents = true}) =>
      TimeLine(timeline.time(value, suppressEvents));

  /// sets Factor that's used to scale time in the animation where 1 = normal speed (the default), 0.5 = half speed, 2 = double speed, etc.
  set timeScale(num value) => timeline.timeScale(value);

  ///get Factor that's used to scale time in the animation where 1 = normal speed (the default), 0.5 = half speed, 2 = double speed, etc.
  num get timeScale => timeline.timeScale();

  TimeLine to(dynamic target, dynamic vars, {dynamic position = "+=0"}) =>
      TimeLine(timeline.to(target, jsify(vars), position));

  ///sets the total duration of the tween in seconds including any repeats or repeatDelays.
  set totalDuration(num value) => timeline.totalDuration(value);

  ///Gets or sets the total duration of the tween in seconds including any repeats or repeatDelays.
  num get totalDuration => timeline.totalDuration();

  num totalProgress(num value, {bool suppressEvents = true}) =>
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

  /// sets the timeline's yoyo state, where true causes the timeline to go back and forth, alternating backward and forward on each repeat.
  set yoyo(bool value) => timeline.yoyo(value);

  ///Gets the timeline's yoyo state, where true causes the timeline to go back and forth, alternating backward and forward on each repeat.
  bool get yoyo => timeline.yoyo();
}
