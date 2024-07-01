import 'package:proyecto/domain/entity/Book.dart';

class BookDto extends Book {

  BookDto({
    super.id,
    super.title,
    super.authors,
    super.description,
    super.edition,
    super.format,
    super.num_pages,
    super.rating,
    super.rating_count,
    super.review_count,
    super.genres,
    super.genre_list,
    super.image_url,
  });

  factory BookDto.toObject(Map<String, dynamic> json){
    return BookDto(
      id: json["id"],
      title: json["title"],
      authors: json["authors"],
      description: json["description"],
      edition: json["edition"],
      format: json["format"],
      num_pages: json["num_pages"],
      rating: json["rating"],
      rating_count: json["rating_count"],
      review_count: json["review_count"],
      genres: json["genres"],
      genre_list: json["genre_list"],
      image_url: json["image_url"]
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "authors": authors,
    "description": description,
    "edition": edition,
    "format": format,
    "num_pages": num_pages,
    "rating": rating,
    "rating_count": rating_count,
    "review_count": review_count,
    "genres": genres,
    "genre_list": genre_list,
    "image_url": image_url
  };

}