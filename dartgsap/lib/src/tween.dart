import 'js/js_gsap.dart';

class Tween {
  final JSTween jsTween;

  Tween(this.jsTween);

  /// sets the animation's initial delay which is the length of time in seconds before the animation should begin.
  set delay(num time) => jsTween.delay(time);

  ///Gets the animation's initial delay which is the length of time in seconds before the animation should begin.
  num get delay => jsTween.delay();

  /// sets the animation's duration, not including any repeats or repeatDelays.
  set duration(num value) => jsTween.duration(value);

  /// Gets  the animation's duration, not including any repeats or repeatDelays.
  num get duration => jsTween.duration();

  /// Returns the time at which the animation will finish according to the parent timeline's local time.
  num endTime({bool includeRepeats = true}) => jsTween.endTime(includeRepeats);

  ///Gets or sets an event callback like "onComplete", "onUpdate", "onStart", "onReverseComplete" or "onRepeat" along with any parameters that should be passed to that callback.
  Tween eventCallback(String type, Function callback, List? params) =>
      Tween(jsTween.eventCallback(type, callback, params));

  ///Converts a local time to the corresponding time on the gsap.globalTimeline (factoring in all nesting, timeScales, etc.).
  num globalTime(num localTime) => jsTween.globalTime(localTime);

  ///Flushes any internally-recorded starting/ending values which can be useful if you want to restart an animation without reverting to any previously recorded starting values.
  Tween invalidate() => Tween(jsTween.invalidate());

  /// Indicates whether or not the animation is currently active (meaning the virtual playhead is actively moving across this instance's time span and it is not paused, nor are any of its ancestor timelines).
  bool isActive() => jsTween.isActive();

  /// Gets the iteration (the current repeat) of tweens.
  num get iteration => jsTween.iteration();

  /// sets the iteration (the current repeat) of tweens.
  set iteration(num iteration) => jsTween.iteration(iteration);

  /// Kills the animation entirely or in part depending on the parameters. To kill means to immediately stop the animation, remove it from its parent timeline, and release it for garbage collection.
  Tween kill({Object? obj, String propertiesList = "all"}) =>
      Tween(jsTween.kill(obj, propertiesList));

  ///Pauses the instance, optionally jumping to a specific time.
  Tween pause({int? atTime, bool suppressEvents = true}) =>
      Tween(jsTween.pause(atTime, suppressEvents));

  /// sets the animation's paused state which indicates whether or not the animation is currently paused.
  set paused(bool value) => jsTween.paused(value);

  ///Gets  the animation's paused state which indicates whether or not the animation is currently paused.
  bool get paused => jsTween.paused();

  ///Begins playing forward, optionally from a specific time (by default playback begins from wherever the playhead currently is).
  Tween play({num? from, bool suppressEvents = true}) =>
      Tween(jsTween.play(from, suppressEvents));

  ///Gets or sets the tween's progress which is a value between 0 and 1 indicating the position of the virtual playhead (excluding repeats) where 0 is at the beginning, 0.5 is halfway complete, and 1 is complete.
  Tween progress(num? value, {bool suppressEvents = true}) =>
      Tween(jsTween.progress(value, suppressEvents));

  ///sets the number of times that the tween should repeat after its first iteration.
  set repeat(num value) => jsTween.repeat(value);

  ///Gets the number of times that the tween should repeat after its first iteration.
  num get repeat => jsTween.repeat();

  /// sets the amount of time in seconds between repeats.
  set repeatDelay(num value) => jsTween.repeatDelay(value);

  /// Gets the amount of time in seconds between repeats.
  num get repeatDelay => jsTween.repeatDelay();

  ///Restarts and begins playing forward from the beginning.
  Tween restart({bool includeDelay = false, bool suppressEvents = true}) =>
      Tween(jsTween.restart(includeDelay, suppressEvents));

  ///Resumes playing without altering direction (forward or reversed).
  Tween resume() => Tween(jsTween.resume());

  ///Reverses playback so that all aspects of the animation are oriented backwards including, for example, a tween's ease.
  Tween reverse([dynamic from, bool suppressEvents = true]) =>
      Tween(jsTween.reverse([from, suppressEvents]));

  /// sets the animation's reversed state which indicates whether or not the animation should be played backwards.
  set reversed(bool value) => jsTween.reversed(value);

  ///Gets the animation's reversed state which indicates whether or not the animation should be played backwards.
  bool get reversed => jsTween.reversed();

  /// Reverts the animation and kills it, returning the targets to their pre-animation state including the removal of inline styles added by the animation.
  Tween revert() => Tween(jsTween.revert());

  ///Jumps to a specific time without affecting whether or not the instance is paused or reversed.
  Tween seek(dynamic time, {bool suppressEvents = true}) =>
      Tween(jsTween.seek(time, suppressEvents));

  ///sets the time at which the animation begins on its parent timeline (after any delay that was defined).
  set startTime(num value) => jsTween.startTime(value);

  ///Gets  the time at which the animation begins on its parent timeline (after any delay that was defined).
  num get startTime => jsTween.startTime();

  ///An array of target objects whose properties the Tween animates. If selector text was used when creating the tween, this array will contain the DOM elements that matched that query string.
  List targets() => jsTween.targets();

  /// Returns a Function so that you can uses function to track when a tween or timeline is complete.
  Function then(Function callback) => jsTween.then(callback);

  ///Gets or sets the local position of the playhead (essentially the current time), not including any repeats or repeatDelays.
  Tween time(int? value, {bool suppressEvents = true}) =>
      Tween(jsTween.time(value, suppressEvents));

  /// sets Factor that's used to scale time in the animation where 1 = normal speed (the default), 0.5 = half speed, 2 = double speed, etc.
  set timeScale(num value) => jsTween.timeScale(value);

  ///get Factor that's used to scale time in the animation where 1 = normal speed (the default), 0.5 = half speed, 2 = double speed, etc.
  num get timeScale => jsTween.timeScale();

  ///sets the total duration of the tween in seconds including any repeats or repeatDelays.
  set totalDuration(num value) => jsTween.totalDuration(value);

  ///Gets or sets the total duration of the tween in seconds including any repeats or repeatDelays.
  num get totalDuration => jsTween.totalDuration();

  ///Gets or sets the tween's totalProgress which is a value between 0 and 1 indicating the position of the virtual playhead (including repeats) where 0 is at the beginning, 0.5 is halfway complete, and 1 is complete.
  num totalProgress(num value, {bool suppressEvents = true}) =>
      jsTween.totalProgress(value, suppressEvents);

  /// Gets or sets the position of the playhead according to the totalDuration which includes any repeats and repeatDelays.
  num totalTime(num time, {bool suppressEvents = true}) =>
      jsTween.totalTime(time, suppressEvents);

  /// sets the timeline's yoyo state, where true causes the timeline to go back and forth, alternating backward and forward on each repeat.
  set yoyo(bool value) => jsTween.yoyo(value);

  ///Gets the timeline's yoyo state, where true causes the timeline to go back and forth, alternating backward and forward on each repeat.
  bool get yoyo => jsTween.yoyo();
}
