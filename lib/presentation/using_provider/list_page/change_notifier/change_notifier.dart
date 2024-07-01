import 'package:flutter/cupertino.dart';
import 'package:proyecto/domain/usecase/get_all_books.dart';

import '../../../../domain/entity/Book.dart';
import '../../../injection_container.dart';

enum BookStatus { initial, loading, success, failed }

class BookChangeNotifier extends ChangeNotifier {

  final GetAllBooks _getAllBooks;

  BookChangeNotifier():
        _getAllBooks = sl.get<GetAllBooks>(),
        _status = BookStatus.initial,
        _books = [];

  BookStatus _status;

  BookStatus get status => _status;

  List<Book> _books;

  List<Book> get books => List.of(_books);

  Future<void> fetchPage() async {
    _status = BookStatus.loading;
    notifyListeners();
    final list = await _getAllBooks();
    _books.addAll(list);
    _status = BookStatus.success;
    notifyListeners();
  }
}
