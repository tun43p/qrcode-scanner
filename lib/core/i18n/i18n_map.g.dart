part of 'i18n.g.dart';

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _I18nEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.pushed': return ({required Object times}) => 'You have pushed the button this many times: ${times}';
			case 'home.increment': return 'Increment';
			case 'core.hello': return 'Hello!';
			default: return null;
		}
	}
}

extension on _I18nFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.pushed': return ({required Object times}) => 'Vous avez appuyé sur le bouton ce nombre de fois: ${times}';
			case 'home.increment': return 'Augmenter';
			case 'core.hello': return 'Salut !';
			default: return null;
		}
	}
}
