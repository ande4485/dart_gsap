import 'package:js/js.dart';

@JS()
class JSMatchMedia {
  external void add(dynamic query, Function handler);
  external void revert();
  //external static JSTween delayedCall(
  //    int time, Function(int) function, List? parameters);
}
