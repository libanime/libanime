enum Language {
  ru(lang: 'ru'),
  en(lang: 'en'),
  multi(lang: 'multi');

  const Language({
    required this.lang
  });

  final String lang;
}