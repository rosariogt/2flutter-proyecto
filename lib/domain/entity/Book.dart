class Book {
  int? id;
  String? title;
  String? authors;
  String? description;
  String? edition;
  String? format;
  int? num_pages;
  double? rating;
  int? rating_count;
  int? review_count;
  String? genres;
  String? genre_list;
  String? image_url;

  Book({
      this.id,
      this.title,
      this.authors,
      this.description,
      this.edition,
      this.format,
      this.num_pages,
      this.rating,
      this.rating_count,
      this.review_count,
      this.genres,
      this.genre_list,
      this.image_url
  });
}