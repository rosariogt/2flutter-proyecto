import 'package:proyecto/domain/entity/Book.dart';

abstract class BookRepository {

  Future<List<Book>> getBooks();

}