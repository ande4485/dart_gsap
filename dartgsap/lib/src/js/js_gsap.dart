import 'package:dart_gsap/dart_gsap.dart';
import 'package:dart_gsap/src/js/js_match_media.dart';
import 'package:dart_gsap/src/js/js_timeline.dart';
import 'package:dart_gsap/src/js/js_tween.dart';
import 'package:js/js.dart';

@JS("gsap")
class JSGsap {
  external static void config(GaspConfig config);
  external static JSTween delayedCall(
      int time, Function function, List? parameters);
  external static JSTimeline exportRoot();
  external static JSTween to(dynamic targets, dynamic vars);
  external static JSTween set(dynamic targets, dynamic vars);
  external static JSTween fromTo(
      dynamic targets, dynamic fromvars, dynamic tovars);
  external static JSTween from(dynamic targets, dynamic fromvars);
  external static void updateRoot(int time);
  external static dynamic getById(String id);
  external static dynamic getProperty(String id, String property, String? unit);
  external static List<JSTween> getTweensOf(dynamic target);
  external static bool isTweening(String target);
  external static void killTweensOf(String className);
  external static JSMatchMedia matchMedia();
  external static void matchMediaRefresh();
  external static dynamic parseEase(String ease);
  external static Function quickTo(String target, String param, dynamic vars);
  external static void registerEase(
      String easeName, void Function() functionEase);
  external static void registerEffect(
      String easeName, void Function() functionEase);
  external static JSTimeline timeline(dynamic parameters);
}
