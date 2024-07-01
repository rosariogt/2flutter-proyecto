import 'package:proyecto/data/source/book_remote_data_source.dart';
import 'package:proyecto/domain/entity/Book.dart';
import 'package:proyecto/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {

  final BookRemoteDataSourceImpl _bookRemoteDataSourceImpl;

  BookRepositoryImpl({required BookRemoteDataSourceImpl bookRemoteDataSourceImpl}):
      _bookRemoteDataSourceImpl = bookRemoteDataSourceImpl;

  @override
  Future<List<Book>> getBooks() async {
    return await _bookRemoteDataSourceImpl.loadBooks();
  }



}