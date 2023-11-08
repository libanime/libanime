enum MediaType {
  anime(type: 'anime'),
  manga(type: 'manga'),
  ranobe(type: 'ranobe'),
  hentai(type: 'hentai'),
  other(type: 'other');

  const MediaType({required this.type});

  final String type;
}
