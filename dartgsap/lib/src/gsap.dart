import 'package:dart_gsap/dart_gsap.dart';
import 'package:dart_gsap/src/js/js_gsap.dart';
import 'package:dart_gsap/src/js/js_timeline.dart';
import 'package:dart_gsap/src/js/js_tween.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

class Gsap {
  static void config(GaspConfig config) {
    return JSGsap.config(config);
  }

  static Tween delayedCall(int time, Function function, {List? parameters}) {
    return Tween(JSGsap.delayedCall(time, function, parameters));
  }

  static TimeLine exportRoot() {
    return TimeLine(JSGsap.exportRoot());
  }

  static Tween from(dynamic targets, Map<String, dynamic> fromvars) {
    return Tween(JSGsap.from(targets, jsify(fromvars)));
  }

  static Tween fromTo(dynamic targets, dynamic fromvars, dynamic tovars) {
    return Tween(JSGsap.fromTo(targets, jsify(fromvars), jsify(tovars)));
  }

  static dynamic getById(String id) {
    var returnValue = JSGsap.getById(id);
    if (returnValue is JSTween) {
      return Tween(returnValue);
    } else {
      return TimeLine(returnValue);
    }
  }

  static dynamic getProperty(String id, String property, {String? unit}) {
    return JSGsap.getProperty(id, property, unit);
  }

  static List<Tween> getTweensOf(dynamic target) {
    return List.castFrom(JSGsap.getTweensOf(target));
  }

  static bool isTweening(String target) {
    return JSGsap.isTweening(target);
  }

  static void killTweensOf(String className) {
    return JSGsap.killTweensOf(className);
  }
  //TODO ?
  //static MatchMedia matchMedia() {
  //  return JSGsap.matchMedia();
  // }

  static void matchMediaRefresh() {
    return JSGsap.matchMediaRefresh();
  }

  static dynamic parseEase(String ease) {
    return JSGsap.parseEase(ease);
  }

  //TODO ???
  // static Function quickSetter()

  static Function quickTo(
      String target, String param, Map<String, dynamic> vars) {
    return JSGsap.quickTo(target, param, jsify(vars));
  }

//TODO ??
  // static void registerEase(String easeName, Function(progress) progress){
  //   return JSGsap.registerEase(easeName,allowInterop(progress) );

//  }
static void registerEffect()=> JSGsap.registerEffect(easeName, () { })

// TODO
// registerPlugin()

  static Tween set(dynamic targets, Map<String, dynamic> vars) {
    return Tween(JSGsap.set(targets, jsify(vars)));
  }

  static TimeLine timeline({Map<String, dynamic>? parameters}) {
    return TimeLine(JSTimeline(jsify(parameters ?? {})));
  }

  static Tween to(dynamic target, Map<String, dynamic> vars) {
    return Tween(JSGsap.to(target, jsify(vars)));
  }

  static void updateRoot(int time) {
    return JSGsap.updateRoot(time);
  }
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
