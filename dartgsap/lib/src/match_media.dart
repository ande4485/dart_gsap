import 'package:js/js_util.dart';

import '../dart_gsap.dart';
import 'js/js_match_media.dart';

class MatchMedia {
  JSMatchMedia matchMedia;
  MatchMedia(this.matchMedia);

  add(dynamic query, Function(Context context) handler) {
    return matchMedia.add(
        query is String ? query : jsify(query), allowInterop(handler));
  }

  revert() {
    return matchMedia.revert();
  }
}
