import 'package:js/js.dart';

import 'js/js_observer.dart';

class Observer {
  JsObserver observer;
  Observer(this.observer);

  disable() => observer.disable();
  //enable(Event event) => observer.enable(event);
  kill() => observer.kill();
  static Observer create(ObserverOptions options) =>
      Observer(JsObserver.create(options.toJsObservertionOptions()));
  static List<Observer> getAll() =>
      JsObserver.getAll().map((e) => Observer(e)).toList();
  static Observer getById(String id) => Observer(JsObserver.getById(id));
}

class ObserverOptions {
  ///The ease to use for the looping preview animation.
  num? ease;

  ///The duration of the looping preview animation (each iteration)
  num? duration;

  /// The motion path along which to animate the target(s). This can be a direct reference to a or selector text or path data like "M9,100c0,0,18-41,49-65" or an Array of points through which the path should be plotted.
  dynamic path;

  ///The color of the path stroke (only applies if no path is defined and MotionPathHelper must create one).
  String? pathColor;

  /// The stroke-width of the path (only applies if no path is defined and MotionPathHelper must create one).
  num? pathWidth;

  ///The opacity of the path stroke (only applies if no path is defined and MotionPathHelper must create one).
  num? pathOpacity;

  /// when lockAxis: true is set, the first drag movement (with type: "pointer" and/or "touch") after each press will set the axis property to "x" or "y", depending on which direction the user moved. You can use the onLockAxis() callback to know when it gets set.
  String? axis;

  ///if true, it will make the touch/pointer-related listeners use the capture phase. Like doing addEventListener("[type]", func, {capture: true});
  bool? capture;

  ///by default, Observer will debounce events so that deltas are additive over the course of each requestAnimationFrame() tick in order to maximize performance, but you can disable that with debounce: false in which case it will check immediately on every event. The debounce affects all callbacks except onPress, onRelease, onHover, onHoverEnd, onClick, onDragStart, and onDragEnd because those aren't delta-related.
  bool? debounce;

  ///the minimum distance (in pixels) necessary to be considered "dragging". This can help prevent tiny motions especially on touch devices from indicating intent. For example, just pressing down with a finger on a phone may register slight movement of a few pixels even though the user thinks their finger was stationary. dragMinimum only applies to the initial movement after pressing down, but continued dragging thereafter would only be subject to "tolerance" throttling.
  num? dragMinimum;

  ///an arbitrary string ID which an be used to get the Observer via Observer.getById().
  String? id;

  ///elements that you'd like the observer to IGNORE, so that when a scroll/touch/pointer/mouse event is triggered by one of these elements, it gets ignored completely. It checks the event.target to discern if the event should be ignored. You can define ignore as an Element reference, selector text like ".ignore-me", or an Array of elements (it can be as many as you'd like).
  dynamic ignore;

  /// if true, the Observer will watch the direction of the very first drag move after each press (with type: "pointer" and/or "touch") and lock into that direction until the user releases the pointer/touch. So if the first drag is horizontal, then only the horizontal-related callbacks like onChangeX() will fire until the pointer/touch is released. There's even an onLockAxis() callback that you can tie into.
  bool? lockAxis;

  ///function to call when there is movement on either the y-axis (vertically) or the x-axis (horizontally). It will keep calling the function as long as the movement continues (subject to any tolerance threshold).
  Function(Observer observer)? onChange;

  ///function to call when there is movement on the x-axis (horizontally). It will keep calling the function as long as the movement continues (subject to any tolerance threshold).
  Function(Observer observer)? onChangeX;

  /// function to call when there is movement on the y-axis (vertically). It will keep calling the function as long as the movement continues (subject to any tolerance threshold).
  Function(Observer observer)? onChangeY;

  ///function to call when the target is clicked.
  Function(Observer observer)? onClick;

  ///function to call when downward motion is detected, meaning the delta values increase (like dragging your finger/mouse DOWNWARD...which makes the y coordinate increase). If you want to invert only the mouse wheel delta, you can set wheelSpeed: -1 because it's a multiplier.
  Function(Observer observer)? onDown;

  ///function to call when the user presses down on the target and then begins dragging (subject to dragMinimum). This only applies to "touch" and/or "pointer" types.
  Function(Observer observer)? onDragStart;

  ///function to call when the user moves the pointer/touch/mouse while pressing on the target element (only applies to "touch" and/or "pointer" types).
  Function(Observer observer)? onDrag;

  ///function to call when the user stops dragging on the target element (only applies to "touch" and/or "pointer" types).
  Function(Observer observer)? onDragEnd;

  ///function to call when motion is detected toward the left direction.
  Function(Observer observer)? onLeft;

  ///function to call when the axis gets locked (requires lockAxis: true). You can check which axis via the Observer's axis property ("x" or "y").
  Function(Observer observer)? onLockAxis;

  ///function to call when the pointer/mouse hovers over the target ("pointerenter"/"mouseenter" event).
  Function(Observer observer)? onHover;

  ///function to call when the pointer/mouse moves off the target ("pointerleave"/"mouseleave" event).
  Function(Observer observer)? onHoverEnd;

  ///function to call when the user moves the pointer/mouse while hovered over the target element (only applies to "pointer" types). It listens for "pointermove"/"mousemove" events internally. Use onDrag if you want it to fire only while pressing and dragging. Note that when you define an onMove, it causes the Observer to measure delta values while hovering over the target, consequently triggering the appropriate movement-related callbacks like onUp, onDown, onChange, etc. for any pointer/mouse movement while over the target. Normally the movement-related callbacks are only triggered when the user presses and drags.
  Function(Observer observer)? onMove;

  ///function to call when the user presses down on the target element (only applies to "touch" and/or "pointer" types).
  Function(Observer observer)? onPress;

  ///function to call when the touch/pointer is released after the onPress was called (only applies to "touch" and/or "pointer" types).
  Function(Observer observer)? onRelease;

  ///function to call when motion is detected toward the right direction.
  Function(Observer observer)? onRight;

  /// function to call when changes have ceased for at least 0.25 seconds (configurable with onStopDelay)
  Function(Observer observer)? onStop;

  ///number of seconds to wait after changes have ceased firing before the onStop gets called (default: 0.25 seconds).
  Function(Observer observer)? onStopDelay;

  ///function to call when motion switches direction on the x-axis (horizontally).
  Function(Observer observer)? onToggleX;

  ///function to call when motion switches direction on the y-axis (vertically).
  Function(Observer observer)? onToggleY;

  ///function to call when upward motion is detected, meaning the delta values decrease (like dragging your finger/mouse UPWARD...which makes the y coordinate decrease). If you want to invert only the mouse wheel delta, you can set wheelSpeed: -1 because it's a multiplier.
  Function(Observer observer)? onUp;

  ///function to call when the mouse wheel is used.
  Function(Observer observer)? onWheel;

  ///a multiplier for scroll delta values. This only applies to type "scroll", meaning when the target dispatches a scroll event which is different than a wheel event. You could set scrollSpeed: -1 to invert the delta values and have it call onUp instead of onDown (and vice versa). scrollSpeed: 0.5 would make the delta values half of what they'd normally be. Note: there's also a separate wheelSpeed option that only applies to wheel events.
  num? scrollSpeed;

  ///the element whose events should be listened for. By default, it's the main viewport.
  dynamic target;

  /// the minimum distance (in pixels) necessary to trigger one of the callbacks like onUp, onDown, onChangeY, etc. So, for example, if the tolerance is 10 but the user only moves 8 pixels, no callback will be fired. Once the distance exceeds the tolerance amount, it fires the callbacks and resets, waiting for that distance to be exceeded again before firing the callback(s).
  num? tolerance;

  ///a comma-delimited list of the types of actions you'd like to listen for which can include any (or all) of the following: "wheel,touch,scroll,pointer". "touch" works on any touch devices regardless of browser (iOS/Android may use TouchEvents under the hood whereas Microsoft may use PointerEvents but Observer includes them both in "touch"). "pointer" covers any non-touch pointer/mouse press/drag/swipe movements. "wheel" is for mouse wheel movements, and "scroll" is for scroll events. Default is "wheel,touch,pointer"
  String? type;

  ///a multiplier for wheel delta values. By default, it merely passes along the wheel event's delta that the browser reports but perhaps it seems faster/slower than when you press/drag with the pointer and you need a way to make them more similar. To make the wheel delta values half of what they normally are, for example, you'd do wheelSpeed: 0.5. You could set wheelSpeed: -1 to invert the delta values and have it call onUp instead of onDown (and vice versa). Note: there's also a separate scrollSpeed option that only applies to scroll events.
  num? wheelSpeed;

  bool? preventDefault;

  ObserverOptions(
      {this.ease,
      this.duration,
      this.path,
      this.pathColor,
      this.pathWidth,
      this.pathOpacity,
      this.axis,
      this.capture,
      this.debounce,
      this.dragMinimum,
      this.id,
      this.ignore,
      this.lockAxis,
      this.onChange,
      this.onChangeY,
      this.onClick,
      this.onDown,
      this.onDragStart,
      this.onDrag,
      this.onDragEnd,
      this.onLeft,
      this.onLockAxis,
      this.onHover,
      this.onHoverEnd,
      this.onMove,
      this.onPress,
      this.onRelease,
      this.onRight,
      this.onStop,
      this.onStopDelay,
      this.onToggleX,
      this.onToggleY,
      this.onUp,
      this.onWheel,
      this.scrollSpeed,
      this.target,
      this.tolerance,
      this.type,
      this.wheelSpeed,
      this.preventDefault});

  JSObserverOptions toJsObservertionOptions() {
    return JSObserverOptions(
        ease: ease,
        duration: duration,
        path: path,
        pathColor: pathColor,
        pathWidth: pathWidth,
        pathOpacity: pathOpacity,
        axis: axis,
        capture: capture,
        debounce: debounce,
        dragMinimum: dragMinimum,
        id: id,
        ignore: ignore,
        lockAxis: lockAxis,
        onChange: onChange != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onChange!(observer);
              })
            : null,
        onChangeX: onChangeX != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onChangeX!(observer);
              })
            : null,
        onChangeY: onChangeY != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onChangeY!(observer);
              })
            : null,
        onClick: onClick != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onClick!(observer);
              })
            : null,
        onDown: onDown != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onDown!(observer);
              })
            : null,
        onDragStart: onDragStart != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onDragStart!(observer);
              })
            : null,
        onDrag: onDrag != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onDrag!(observer);
              })
            : null,
        onDragEnd: onDragEnd != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onDragEnd!(observer);
              })
            : null,
        onLeft: onLeft != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onLeft!(observer);
              })
            : null,
        onLockAxis: onLockAxis != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onLockAxis!(observer);
              })
            : null,
        onHover: onHover != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onHover!(observer);
              })
            : null,
        onHoverEnd: onHoverEnd != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onHoverEnd!(observer);
              })
            : null,
        onMove: onMove != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onMove!(observer);
              })
            : null,
        onPress: onPress != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onPress!(observer);
              })
            : null,
        onRelease: onRelease != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onRelease!(observer);
              })
            : null,
        onRight: onRight != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onRight!(observer);
              })
            : null,
        onStop: onStop != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onStop!(observer);
              })
            : null,
        onStopDelay: onStopDelay != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onStopDelay!(observer);
              })
            : null,
        onToggleX: onToggleX != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onToggleX!(observer);
              })
            : null,
        onToggleY: onToggleY != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onToggleY!(observer);
              })
            : null,
        onUp: onUp != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onUp!(observer);
              })
            : null,
        onWheel: onWheel != null
            ? allowInterop((jsObserver) {
                // Inside this function, you can convert JsObserver to Observer
                // and then call your Dart onDown function.
                final observer = Observer(jsObserver);

                onWheel!(observer);
              })
            : null,
        scrollSpeed: scrollSpeed,
        target: target,
        tolerance: tolerance,
        type: type,
        wheelSpeed: wheelSpeed,
        preventDefault: preventDefault);
  }
}
