@JS()
library gsap;

import 'package:js/js.dart';

import '../../dart_gsap.dart';
import 'js_match_media.dart';

@JS("gsap")
class JSGsap {
  external static config(GaspConfig config);
  external static Context context();
  external static void defaults(dynamic defaults);
  external static JSTween delayedCall(
      int time, Function function, List? parameters);
  external static JSTimeline exportRoot();
  external static dynamic to(dynamic targets, dynamic vars);
  external static JSTween set(dynamic targets, dynamic vars);
  external static JSTween fromTo(
      dynamic targets, dynamic fromvars, dynamic tovars);
  external static JSTween from(dynamic targets, dynamic fromvars);
  external static void updateRoot(num time);
  external static dynamic getById(String id);
  external static dynamic getProperty(String id, String property, String? unit);
  external static List<JSTween> getTweensOf(dynamic target);
  external static bool isTweening(String target);
  external static void killTweensOf(String className);
  external static JSMatchMedia matchMedia();
  external static void matchMediaRefresh();
  external static dynamic parseEase(String ease);
  external static Function quickSetter(
      String target, String attribute, String unit);
  external static Function quickTo(String target, String param, dynamic vars);
  external static void registerEase(
      String easeName, Function(num) functionEase);
  external static void registerEffect(
      RegisterEffectOption registerEffectOption);
  external static JSTimeline timeline([JsTimeLineOptions? jsTimeLineOptions]);
  external static String version;
}

@JS()
@staticInterop
class JSTween {
  external factory JSTween(args);
  external static JSTween from(dynamic targets, dynamic vars);
  external static JSTween fromTo(
      dynamic targets, dynamic fromVars, dynamic toVars);
  external static JSTween killTweensOf(
      Object? obj, String props, bool onlyActive);
  external static JSTween set(dynamic targets, dynamic vars);
  external static JSTween to(dynamic targets, dynamic vars);
}

extension TweenExtension on JSTween {
  external dynamic delay([num time]);
  external dynamic duration([num value]);
  external num endTime(bool includeRepeats);
  external JSTween eventCallback(String type, Function callback, List? params);

  external num globalTime(num localTime);
  external JSTween invalidate();
  external bool isActive();
  external dynamic iteration([num? iteration]);
  external JSTween kill(Object? obj, String propertiesList);

  external JSTween pause(num? atTime, bool suppressEvents);
  external dynamic paused([bool value]);
  external JSTween play(num? from, bool suppressEvents);
  external dynamic progress(num? value, bool suppressEvents);
  external dynamic repeat([num? value]);
  external dynamic repeatDelay([num? value]);
  external JSTween restart(bool includeDelay, bool suppressEvents);
  external JSTween resume();
  external JSTween reverse([dynamic from, bool suppressEvents]);
  external dynamic reversed([bool? value]);

  external JSTween revert();
  external JSTween seek(dynamic time, bool suppressEvents);

  external dynamic startTime([num value]);
  external List targets();

  external Function then(Function callback);
  external JSTween time(num? value, bool suppressEvents);
  external dynamic timeScale([num value]);
  external dynamic totalDuration([num value]);
  external num totalProgress(num value, bool suppressEvents);
  external num totalTime(num? time, bool suppressEvents);
  external bool yoyo([bool value]);
}

@JS('gsap.timeline')
class JSTimeline {
  external factory JSTimeline([JsTimeLineOptions? options]);
  external JSTimeline add(dynamic child, dynamic position);
  external JSTimeline addLabel(String label, dynamic position);
  external JSTimeline addPause(
      dynamic position, Function? callback, List? params);
  external JSTimeline call(Function callback, List? params, dynamic position);
  external JSTimeline clear(bool labels);
  external dynamic currentLabel(String? value);
  external dynamic delay([num time]);
  external dynamic duration([num duration]);
  external num endTime(bool includeRepeats);
  external dynamic eventCallback(String type, Function? callback, List? params);
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
  external dynamic iteration([num value]);
  external JSTimeline kill();
  external JSTimeline killTweensOf(
      dynamic targets, String props, bool onlyActive);
  external String nextLabel(num time);
  external JSTimeline pause(num? atTime, bool suppressEvents);
  external dynamic paused([bool value]);

  external JSTimeline play(num? from, bool suppressEvents);
  external String previousLabel(num time);
  external dynamic progress(num? value, bool suppressEvents);
  external dynamic recent();
  external JSTimeline remove(dynamic value);
  external JSTimeline removeLabel(String label);
  external JSTimeline removePause(dynamic pause);
  external dynamic repeat([num value]);
  external dynamic repeatDelay([num value]);
  external JSTimeline restart(bool includeDelay, bool suppressEvents);
  external JSTimeline resume();
  external JSTimeline reverse(dynamic from, bool suppressEvents);
  external dynamic reversed([bool? value]);

  external JSTimeline revert();
  external JSTimeline seek(dynamic time, bool suppressEvents);
  external JSTimeline set(dynamic target, dynamic vars, dynamic position);
  external JSTimeline shiftChildren(
      num amount, bool adjustLabels, num ignoreBeforeTime);

  external dynamic startTime([num value]);

  external dynamic then(Function callback);
  external JSTimeline time(num? value, bool suppressEvents);
  external dynamic timeScale([num value]);
  external JSTimeline to(dynamic target, dynamic vars, dynamic position);
  external num totalDuration([num value]);
  external num totalProgress(num? value, bool suppressEvents);
  external num totalTime(num? time, bool suppressEvents);
  external JSTween tweenFromTo(
      dynamic fromPosition, dynamic toPosition, dynamic vars);
  external JSTween tweenTo(dynamic position, dynamic vars);
  external bool yoyo([bool value]);
}

@JS()
@anonymous
class JsTimeLineOptions {
  /// If autoRemoveChildren is set to true, as soon as child tweens/timelines complete, they will automatically get killed/removed. This is normally undesireable because it prevents going backwards in time (like if you want to reverse() or set the progress lower, etc.). It can, however, improve speed and memory management. The root timelines use autoRemoveChildren: true.
  external bool? autoRemoveChildren;

  ///The scope to be used for all of the callbacks (onStart, onUpdate, onComplete, etc.). The scope is what this refers to inside any of the callbacks.
  external Object? callbackScope;

  ///Amount of delay in seconds before the animation should begin.
  external num? delay;

  ///A function that should be called when the animation has completed.
  external Function? onComplete;

  ///An array of parameters to pass the onComplete function. For example, gsap.timeline({onComplete: myFunction, onCompleteParams: ["param1", "param2"]});.
  external List? onCompleteParams;

  ///A function to call when the animation is interrupted min animation. Note that this does not fire if the animation completes normally.
  external Function? onInterrupt;

  ///An Array of parameters to pass the onInterrupt function. For example, gsap.to(".class", {x:100, onInterrupt:myFunction, onInterruptParams:["param1", "param2"]});.
  external List? onInterruptParams;

  ///A function that should be called each time the animation repeats.
  external Function? onRepeat;

  ///An Array of parameters to pass the onRepeat function. For example, gsap.timeline({onRepeat: myFunction, onRepeatParams: ["param1", "param2"]});.
  external List? onRepeatParams;

  /// A function that should be called when the animation has reached its beginning again from the reverse direction. For example, if reverse() is called the tween will move back towards its beginning and when its time reaches 0, onReverseComplete will be called. This can also happen if the animation is placed in a timeline instance that gets reversed and plays the animation backwards to (or past) the beginning.
  external Function? onReverseComplete;

  /// An array of parameters to pass the onReverseComplete function. For example, gsap.timeline({onReverseComplete: myFunction, onReverseCompleteParams: ["param1", "param2"]});.
  external List? onReverseCompleteParams;

  /// A function that should be called when the animation begins (when its time changes from 0 to some other value which can happen more than once if the tween is restarted multiple times).
  external Function? onStart;

  /// An array of parameters to pass the onStart function. For example, gsap.timeline({onStart: myFunction, onStartParams: ["param1", "param2"]});.
  external List? onStartParams;

  /// A function that should be called every time the animation updates (on every frame while the animation is active).
  external Function? onUpdate;

  /// An array of parameters to pass the onUpdate function. For example, gsap.timeline({onUpdate: myFunction, onUpdateParams: ["param1", "param2"]});.
  external List? onUpdateParams;

  /// If true, the animation will pause itself immediately upon creation.
  external bool? paused;

  ///Number of times that the animation should repeat after its first iteration. For example, if repeat is 1, the animation will play a total of twice (the initial play plus 1 repeat). To repeat indefinitely, use -1. repeat should always be an integer.
  external num? repeat;

  ///Amount of time in seconds between repeats. For example, if repeat is 2 and repeatDelay is 1, the animation will play initially, then wait for 1 second before it repeats, then play again, then wait 1 second again before doing its final repeat.
  external num? repeatDelay;

  ///Setting repeatRefresh: true causes a repeating timeline to invalidate() all of its child tweens and re-record their starting/ending values internally on each full iteration (not including yoyo's). This is useful when you use dynamic values (relative, random, or function-based). For example, x: "random(-100, 100)" would get a new random x value on each repeat. duration, delay, and stagger do NOT refresh.
  external bool? repeatRefresh;

  ///Controls whether or not child animations are repositioned automatically (changing their startTime) in order to maintain smooth playback when timing-related properties are changed on-the-fly. For example, imagine that the timeline’s playhead is on a child tween that is 75% complete, moving element’s left from 0 to 100 and then that tween’s reverse() method is called. If smoothChildTiming is false (the default except for the globalTimeline), the tween would flip in place, keeping its startTime consistent. Therefore the playhead of the timeline would now be at the tween’s 25% completion point instead of 75%. See the "How to timelines work?" section below for details.
  external bool? smoothChildTiming;

  /// If true, every other repeat cycle will run in the opposite direction so that the tween appears to go back and forth (forward then backward). This has no affect on the reversed property though. So if repeat is 2 and yoyo is false, it will look like: start - 1 - 2 - 3 - 1 - 2 - 3 - 1 - 2 - 3 - end. But if yoyo is true, it will look like: start - 1 - 2 - 3 - 3 - 2 - 1 - 1 - 2 - 3 - end.
  external bool? yoyo;

  external ScrollTriggerOptions? scrollTrigger;

  ///Anything in the defaults object of a timeline gets inherited by its child animations when they get created, so if you find yourself setting the same ease or duration (or any value) over and over again, this can help make your code more concise
  external Map<String, dynamic>? defaults;
}
