import 'package:js/js.dart';

@JS('gsap.utils')
class JSGsapUtils {
  external static String checkPrefix(String property);
  external static Function clamp(num minimum, num number);
  //TODO external static Function distribute(DistributeOptions options);
  external static String getUnit(String value);
  external static dynamic interpolate(
      dynamic startValue, dynamic endValue, num progress);
  external static num mapRange(
      num inMin, num inMax, num outMin, num outMax, num valueToMap);
  external static num normalize(num minimum, num maximum, num valueToNormalize);
  //TODO external num pipe();

  external static dynamic random(
      num minimum, num maximum, num snapIncrement, bool returnFunction);
  //TODO selector
  external static List shuffle(List array);
  external static num snap(num snapIncrement, num valueToSnap);
  external static List splitColor(String color, bool returnHSL);
  external static List toArray(dynamic targets);
  external static Function unitize(Function function, String? unit);
  external static Function wrap(List value);
  external static Function wrapYoyo(List value);
}

/**@JS()
@anonymous
class DistributeOptions {
  int base = 0;
  int amount;
  int each;
  dynamic from;
  dynamic grid;
  String axis;
  String ease;
  DistributeOptions(this.base, this.amount, this.each, this.from, this.grid,
      this.axis, this.ease);
}**/
