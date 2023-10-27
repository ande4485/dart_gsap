/**import 'dart:html' as html;
import 'dart:js' as js;

void configureTests() {
  // Créez une balise <script> pour charger GSAP depuis le CDN.
  final script = html.ScriptElement()
    ..src =
        'https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.1/gsap.min.js'; // URL du CDN de GSAP
  html.document.body!
      .append(script); // Ajoutez la balise <script> au corps du document.

  // Attendez que GSAP soit chargé avant de continuer.
  script.onLoad.first.then((_) {
    // Vous pouvez exécuter des initialisations supplémentaires ici si nécessaire.
  });
}

// Appelez la fonction de configuration des tests.
void main() {
  configureTests();
}**/
