part of 'i18n.g.dart';

// Path: <root>
class _I18nEn implements BaseTranslations<AppLocale, _I18nEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_I18nEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _I18nEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _I18nEn _root = this; // ignore: unused_field

	// Translations
	late final _I18nHomeEn home = _I18nHomeEn._(_root);
	late final _I18nCoreEn core = _I18nCoreEn._(_root);
}

// Path: home
class _I18nHomeEn {
	_I18nHomeEn._(this._root);

	final _I18nEn _root; // ignore: unused_field

	// Translations
	String pushed({required Object times}) => 'You have pushed the button this many times: ${times}';
	String get increment => 'Increment';
}

// Path: core
class _I18nCoreEn {
	_I18nCoreEn._(this._root);

	final _I18nEn _root; // ignore: unused_field

	// Translations
	String get hello => 'Hello!';
}
