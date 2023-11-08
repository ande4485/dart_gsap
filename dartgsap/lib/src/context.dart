import 'package:js/js.dart';

@JS("gsap.context")
class Context {
  external Map conditions;
  external add(Function addFun);
  external ignore(Function ignoreFun);
}
