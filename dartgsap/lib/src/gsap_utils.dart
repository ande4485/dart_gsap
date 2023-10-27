import 'package:dart_gsap/src/js/js_gsap_utils.dart';
import 'package:js/js_util.dart';

class GsapUtils {
  String checkPrefix(String property) => JSGsapUtils.checkPrefix(property);

  static Function clamp(num minimum, num number) =>
      JSGsapUtils.clamp(minimum, number);
  static String getUnit(String value) => JSGsapUtils.getUnit(value);
  static dynamic interpolate(
      dynamic startValue, dynamic endValue, num progress) {
    var startValueJS = startValue;
    var endValueJS = endValue;

    if (startValue! is num && startValue! is String) {
      startValueJS = jsify(startValue);
    }
    if (endValue! is num && endValue! is String) {
      endValueJS = jsify(endValue);
    }
    return JSGsapUtils.interpolate(startValueJS, endValueJS, progress);
  }

  static num mapRange(
          num inMin, num inMax, num outMin, num outMax, num valueToMap) =>
      JSGsapUtils.mapRange(inMin, inMax, outMin, outMax, valueToMap);

  static num normalize(num minimum, num maximum, num valueToNormalize) =>
      JSGsapUtils.normalize(minimum, maximum, valueToNormalize);
  static dynamic random(num minimum, num maximum,
          {num snapIncrement = 0, bool returnFunction = false}) =>
      JSGsapUtils.random(minimum, maximum, snapIncrement, returnFunction);
  static List shuffle(List array) => JSGsapUtils.shuffle(array);
  static num snap(num snapIncrement, num valueToSnap) =>
      JSGsapUtils.snap(snapIncrement, valueToSnap);
  static List splitColor(String color, {bool returnHSL = false}) =>
      JSGsapUtils.splitColor(color, returnHSL);
  static List toArray(dynamic targets) => JSGsapUtils.toArray(targets);
  static Function unitize(Function function, {String? unit}) =>
      JSGsapUtils.unitize(function, unit);
  static Function wrap(List value) => JSGsapUtils.wrap(value);

  /// value : [List] - The List of values or the minimum number of a range. If an Array is provided, the index becomes the second parameter.
  static Function wrapYoyo(List value) => JSGsapUtils.wrapYoyo(value);
}
