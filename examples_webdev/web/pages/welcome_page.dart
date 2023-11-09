import 'dart:html';

import 'scroll_page.dart';
import 'scroll_to_page.dart';
import 'simple_page.dart';

class WelcomePage {
  BodyElement getBody() {
    final button1 = ButtonElement()..text = 'Simple';
    final button2 = ButtonElement()..text = 'Scroll';
    final button3 = ButtonElement()..text = 'ScrollTo';
    final button4 = ButtonElement()..text = 'Observer';

    button1.onClick.listen((_) {
      BodyElement body = querySelector('body') as BodyElement;
      clearAndAddBackButton(body);
      body.nodes.add(SimplePage().getBody());
    });

    button2.onClick.listen((_) {
      BodyElement body = querySelector('body') as BodyElement;
      clearAndAddBackButton(body);
      body.nodes.add(ScrollPage().getBody());
    });

    button3.onClick.listen((_) {
      BodyElement body = querySelector('body') as BodyElement;
      clearAndAddBackButton(body);
      body.nodes.add(ScrollToPage().getBody());
    });

    final container = DivElement()
      ..id = 'container'
      ..children.addAll([button1, button2, button3]);
    BodyElement body = querySelector('body') as BodyElement;
    body.children.add(container);
    return body;
  }
}

clearAndAddBackButton(BodyElement body) {
  body.nodes.clear();
  body.nodes.add(Element.div()
    ..children.add(ButtonElement()
      ..text = 'Back'
      ..onClick.listen((event) {
        BodyElement body = querySelector('body') as BodyElement;
        body.nodes.clear();
        body = WelcomePage().getBody();
      })));
}
