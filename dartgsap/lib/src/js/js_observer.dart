import 'package:js/js.dart';

@JS("Observer")
class JsObserver {
  ///Disables the Observer, removing the necessary event listeners and firing the onDisable callback if the Observer wasn't already disabled.
  external disable();
  //external enable(Event event);
  external kill();
  external static JsObserver create(JSObserverOptions options);
  external static List<JsObserver> getAll();
  external static JsObserver getById(String id);
}

@JS()
@anonymous
class JSObserverOptions {
  external factory JSObserverOptions(
      {num? ease,
      num? duration,
      dynamic path,
      String? pathColor,
      num? pathWidth,
      num? pathOpacity,
      String? axis,
      bool? capture,
      bool? debounce,
      num? dragMinimum,
      String? id,
      dynamic ignore,
      bool? lockAxis,
      Function(JsObserver observer)? onChange,
      Function(JsObserver observer)? onChangeX,
      Function(JsObserver observer)? onChangeY,
      Function(JsObserver observer)? onClick,
      Function(JsObserver observer)? onDown,
      Function(JsObserver observer)? onDragStart,
      Function(JsObserver observer)? onDrag,
      Function(JsObserver observer)? onDragEnd,
      Function(JsObserver observer)? onLeft,
      Function(JsObserver observer)? onLockAxis,
      Function(JsObserver observer)? onHover,
      Function(JsObserver observer)? onHoverEnd,
      Function(JsObserver observer)? onMove,
      Function(JsObserver observer)? onPress,
      Function(JsObserver observer)? onRelease,
      Function(JsObserver observer)? onRight,
      Function(JsObserver observer)? onStop,
      Function(JsObserver observer)? onStopDelay,
      Function(JsObserver observer)? onToggleX,
      Function(JsObserver observer)? onToggleY,
      Function(JsObserver observer)? onUp,
      Function(JsObserver observer)? onWheel,
      num? scrollSpeed,
      dynamic target,
      num? tolerance,
      String? type,
      num? wheelSpeed,
      bool? preventDefault});
}
