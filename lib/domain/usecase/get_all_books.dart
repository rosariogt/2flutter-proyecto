import 'package:proyecto/domain/entity/Book.dart';
import 'package:proyecto/domain/repository/book_repository.dart';

class GetAllBooks {

  BookRepository _repository;

  GetAllBooks({
    required BookRepository repository
  }): _repository =  repository;

  Future<List<Book>> call() async {
    return await _repository.getBooks();
  }

}