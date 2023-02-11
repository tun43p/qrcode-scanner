part of 'i18n.g.dart';

// Path: <root>
class _I18nFr extends _I18nEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_I18nFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, _I18nEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _I18nFr _root = this; // ignore: unused_field

	// Translations
	@override late final _I18nHomeFr home = _I18nHomeFr._(_root);
	@override late final _I18nCoreFr core = _I18nCoreFr._(_root);
}

// Path: home
class _I18nHomeFr extends _I18nHomeEn {
	_I18nHomeFr._(_I18nFr root) : this._root = root, super._(root);

	@override final _I18nFr _root; // ignore: unused_field

	// Translations
	@override String pushed({required Object times}) => 'Vous avez appuyé sur le bouton ce nombre de fois: ${times}';
	@override String get increment => 'Augmenter';
}

// Path: core
class _I18nCoreFr extends _I18nCoreEn {
	_I18nCoreFr._(_I18nFr root) : this._root = root, super._(root);

	@override final _I18nFr _root; // ignore: unused_field

	// Translations
	@override String get hello => 'Salut !';
}
