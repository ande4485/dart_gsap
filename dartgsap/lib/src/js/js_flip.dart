import 'package:js/js.dart';

import '../timeline.dart';

@JS("Flip")
class JSFlip {
  external static FlipBatch batch(String id);
  external static fit(
      dynamic targetToResize, dynamic destinationTargetOrState, dynamic vars);
  external static TimeLine from(FlipState state, dynamic vars);

  external static Object getState(dynamic targets, dynamic vars);
  external static bool isFlipping(dynamic target);
  external static killFlipsOf(dynamic targets, bool complete);
  external static List makeAbsolute(dynamic targets);
  external static TimeLine to(FlipState state, dynamic vars);
}

class FlipBatch {
  external clear([bool value]);

// triggers ONLY the getState() of all actions
  external getState([bool value]);

// Searches the state objects that were captured inside ANY of this batch actions' most recent getState() call and returns the first one it finds that matches the provided data-flip-id value. For example, if you Flip.getState("#someID") inside this action's getState() and there's a <div id="#someID" data-flip-id="box1"></div>, you could find that using action.getStateById("box1"); As a last resort, it will search batch.state too.
  external getStateById(String id);

// kills entire batch
  external kill();

// same as action.kill()
  external remove(action);

// executes the following parts of every action in this order: getState(), loadState(), setState(), animate(), onEnter(), onLeave(), onStart(), onComplete()
  external run([bool value]);
}

class FlipState {
  external FlipState update(soft);

  external FlipState clear();

  external FlipState fit(state, scale, nested);

  external getProperty(element, property);

  external FlipState add(state);

  external compare(state);

  external recordInlineStyles();

  external interrupt(soft);

  external updateVisibility();

  external getElementState(element);

  external makeAbsolute();
}
