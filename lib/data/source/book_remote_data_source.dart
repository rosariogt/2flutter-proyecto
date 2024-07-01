import 'package:proyecto/data/dto/BookDto.dart';

import 'network/api.dart';

abstract class BookRemoteDataSource {

  Future<List<BookDto>> loadBooks();

}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {

  Api api;

  BookRemoteDataSourceImpl(this.api);

  @override
  Future<List<BookDto>> loadBooks() async {
    List<dynamic> jsonResponse = await api.get("/books");
    return (jsonResponse as List).map((book) => BookDto.toObject(book)).toList();
  }
}