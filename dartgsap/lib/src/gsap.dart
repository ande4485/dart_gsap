import 'package:js/js.dart';
import 'package:js/js_util.dart';

import '../dart_gsap.dart';
import 'js/js_gsap.dart';

class Gsap {
  static void config(GaspConfig config) => JSGsap.config(config);

  static Context context() => JSGsap.context();

  static void defaults(Map<String, dynamic> defaults) =>
      JSGsap.defaults(jsify(defaults));

  static Tween delayedCall(int time, Function function, {List? parameters}) =>
      Tween(JSGsap.delayedCall(time, allowInterop(function), parameters));

  static TimeLine exportRoot() => TimeLine(JSGsap.exportRoot());

  static Tween from(dynamic targets, Map<String, dynamic> fromvars) =>
      Tween(JSGsap.from(targets, jsify(fromvars)));

  static Tween fromTo(dynamic targets, dynamic fromvars, dynamic tovars) =>
      Tween(JSGsap.fromTo(targets, jsify(fromvars), jsify(tovars)));

  static dynamic getById(String id) {
    var returnValue = JSGsap.getById(id);
    if (returnValue is JSTween) {
      return Tween(returnValue);
    } else {
      return TimeLine(returnValue);
    }
  }

  static dynamic getProperty(String id, String property, {String? unit}) =>
      JSGsap.getProperty(id, property, unit);

  static List<Tween> getTweensOf(dynamic target) =>
      List.castFrom(JSGsap.getTweensOf(target));

  static bool isTweening(String target) => JSGsap.isTweening(target);

  static void killTweensOf(String className) => JSGsap.killTweensOf(className);

  static MatchMedia matchMedia() => MatchMedia(JSGsap.matchMedia());

  static void matchMediaRefresh() => JSGsap.matchMediaRefresh();

  static dynamic parseEase(String ease) => JSGsap.parseEase(ease);

  static Function quickSetter(String target, String attribute, String unit) =>
      JSGsap.quickSetter(target, attribute, unit);

  static Function quickTo(
          String target, String param, Map<String, dynamic> vars) =>
      JSGsap.quickTo(target, param, jsify(vars));

  static void registerEase(String easeName, Function(num prog) progress) {
    return JSGsap.registerEase(easeName, allowInterop(progress));
  }

  // Not possible in Dart static void registerEffect(RegisterEffectOption registerEffectOption) =>
  //    JSGsap.registerEffect(registerEffectOption);

// TODO
// registerPlugin()

  static Tween set(dynamic targets, Map<String, dynamic> vars) =>
      Tween(JSGsap.set(targets, jsify(vars)));

  static TimeLine timeline([TimeLineOptions? timeLineOptions]) =>
      TimeLine(timeLineOptions == null
          ? JSGsap.timeline()
          : JSGsap.timeline(timeLineOptions.toJsTimeLineOptions()));

  static Tween to(dynamic target, Map<String, dynamic> vars) {
    var tween = JSGsap.to(target, jsify(vars));

    var newTween = Tween(tween);
    return newTween;
  }

  static void updateRoot(num time) => JSGsap.updateRoot(time);

  static String version() => JSGsap.version;
}

@JS()
@anonymous
class GaspConfig {
  // Must have an unnamed factory constructor with named arguments.
  external factory GaspConfig({
    double autoSleep,
    bool force3D,
    bool nullTargetWarn,
    bool trialWarn,
    Map<String, dynamic> units,
  });
}

@JS()
@anonymous
class RegisterEffectOption {
  external factory RegisterEffectOption(
      {String name,
      Function(dynamic targets, Object config) effect,
      Map<String, dynamic> defaults,
      bool extendTimeline = false});
}

class TimeLineOptions {
  /// If autoRemoveChildren is set to true, as soon as child tweens/timelines complete, they will automatically get killed/removed. This is normally undesireable because it prevents going backwards in time (like if you want to reverse() or set the progress lower, etc.). It can, however, improve speed and memory management. The root timelines use autoRemoveChildren: true.
  bool? autoRemoveChildren;

  ///The scope to be used for all of the callbacks (onStart, onUpdate, onComplete, etc.). The scope is what this refers to inside any of the callbacks.
  Object? callbackScope;

  ///Amount of delay in seconds before the animation should begin.
  num? delay;

  ///A function that should be called when the animation has completed.
  Function? onComplete;

  ///An array of parameters to pass the onComplete function. For example, gsap.timeline({onComplete: myFunction, onCompleteParams: ["param1", "param2"]});.
  List? onCompleteParams;

  ///A function to call when the animation is interrupted min animation. Note that this does not fire if the animation completes normally.
  Function? onInterrupt;

  ///An Array of parameters to pass the onInterrupt function. For example, gsap.to(".class", {x:100, onInterrupt:myFunction, onInterruptParams:["param1", "param2"]});.
  List? onInterruptParams;

  ///A function that should be called each time the animation repeats.
  Function? onRepeat;

  ///An Array of parameters to pass the onRepeat function. For example, gsap.timeline({onRepeat: myFunction, onRepeatParams: ["param1", "param2"]});.
  List? onRepeatParams;

  /// A function that should be called when the animation has reached its beginning again from the reverse direction. For example, if reverse() is called the tween will move back towards its beginning and when its time reaches 0, onReverseComplete will be called. This can also happen if the animation is placed in a timeline instance that gets reversed and plays the animation backwards to (or past) the beginning.
  Function? onReverseComplete;

  /// An array of parameters to pass the onReverseComplete function. For example, gsap.timeline({onReverseComplete: myFunction, onReverseCompleteParams: ["param1", "param2"]});.
  List? onReverseCompleteParams;

  /// A function that should be called when the animation begins (when its time changes from 0 to some other value which can happen more than once if the tween is restarted multiple times).
  Function? onStart;

  /// An array of parameters to pass the onStart function. For example, gsap.timeline({onStart: myFunction, onStartParams: ["param1", "param2"]});.
  List? onStartParams;

  /// A function that should be called every time the animation updates (on every frame while the animation is active).
  Function? onUpdate;

  /// An array of parameters to pass the onUpdate function. For example, gsap.timeline({onUpdate: myFunction, onUpdateParams: ["param1", "param2"]});.
  List? onUpdateParams;

  /// If true, the animation will pause itself immediately upon creation.
  bool? paused;

  ///Number of times that the animation should repeat after its first iteration. For example, if repeat is 1, the animation will play a total of twice (the initial play plus 1 repeat). To repeat indefinitely, use -1. repeat should always be an integer.
  num? repeat;

  ///Amount of time in seconds between repeats. For example, if repeat is 2 and repeatDelay is 1, the animation will play initially, then wait for 1 second before it repeats, then play again, then wait 1 second again before doing its final repeat.
  num? repeatDelay;

  ///Setting repeatRefresh: true causes a repeating timeline to invalidate() all of its child tweens and re-record their starting/ending values internally on each full iteration (not including yoyo's). This is useful when you use dynamic values (relative, random, or function-based). For example, x: "random(-100, 100)" would get a new random x value on each repeat. duration, delay, and stagger do NOT refresh.
  bool? repeatRefresh;

  ///Controls whether or not child animations are repositioned automatically (changing their startTime) in order to maintain smooth playback when timing-related properties are changed on-the-fly. For example, imagine that the timeline’s playhead is on a child tween that is 75% complete, moving element’s left from 0 to 100 and then that tween’s reverse() method is called. If smoothChildTiming is false (the default except for the globalTimeline), the tween would flip in place, keeping its startTime consistent. Therefore the playhead of the timeline would now be at the tween’s 25% completion point instead of 75%. See the "How to timelines work?" section below for details.
  bool? smoothChildTiming;

  /// If true, every other repeat cycle will run in the opposite direction so that the tween appears to go back and forth (forward then backward). This has no affect on the reversed property though. So if repeat is 2 and yoyo is false, it will look like: start - 1 - 2 - 3 - 1 - 2 - 3 - 1 - 2 - 3 - end. But if yoyo is true, it will look like: start - 1 - 2 - 3 - 3 - 2 - 1 - 1 - 2 - 3 - end.
  bool? yoyo;

  ///Anything in the defaults object of a timeline gets inherited by its child animations when they get created, so if you find yourself setting the same ease or duration (or any value) over and over again, this can help make your code more concise
  Map<String, dynamic>? defaults;

  ScrollTriggerOptions? scrollTrigger;

  TimeLineOptions(
      {this.autoRemoveChildren,
      this.callbackScope,
      this.delay,
      this.onComplete,
      this.onCompleteParams,
      this.onInterrupt,
      this.onInterruptParams,
      this.onRepeat,
      this.onRepeatParams,
      this.onReverseComplete,
      this.onReverseCompleteParams,
      this.onStart,
      this.onStartParams,
      this.onUpdate,
      this.onUpdateParams,
      this.paused,
      this.repeat,
      this.repeatDelay,
      this.repeatRefresh,
      this.smoothChildTiming,
      this.yoyo,
      this.defaults,
      this.scrollTrigger});

  JsTimeLineOptions toJsTimeLineOptions() {
    return JsTimeLineOptions()
      ..autoRemoveChildren = autoRemoveChildren
      ..callbackScope = callbackScope
      ..delay = delay
      ..onComplete = onComplete != null ? allowInterop(onComplete!) : onComplete
      ..onCompleteParams = onCompleteParams
      ..onInterrupt =
          onInterrupt != null ? allowInterop(onInterrupt!) : onInterrupt
      ..onInterruptParams = onInterruptParams
      ..onRepeat = onRepeat != null ? allowInterop(onRepeat!) : onRepeat
      ..onRepeatParams = onRepeatParams
      ..onReverseComplete = onReverseComplete != null
          ? allowInterop(onReverseComplete!)
          : onReverseComplete
      ..onReverseCompleteParams = onReverseCompleteParams
      ..onStart = onStart != null ? allowInterop(onStart!) : onStart
      ..onStartParams = onStartParams
      ..onUpdate = onUpdate != null ? allowInterop(onUpdate!) : onUpdate
      ..onUpdateParams = onUpdateParams
      ..paused = paused
      ..repeat = repeat
      ..repeatDelay = repeatDelay
      ..repeatRefresh = repeatRefresh
      ..smoothChildTiming = smoothChildTiming
      ..yoyo = yoyo
      ..scrollTrigger = scrollTrigger
      ..defaults = jsify(defaults);
  }
}
