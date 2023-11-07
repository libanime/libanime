import './service.dart';

class Manga {
  final Map titles;
  final int id;
  final String releaseDate;
  final String summary;
  final List authors;
  final Map status;
  final String coverUrl;
  final List tags;
  final List categories;
  final Service service;

  Manga(this.titles, this.id, this.releaseDate, this.summary, this.authors, this.status, this.coverUrl, this.tags, this.categories, this.service);
}