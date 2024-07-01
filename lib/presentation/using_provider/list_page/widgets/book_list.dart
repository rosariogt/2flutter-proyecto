import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/domain/entity/Book.dart';
import 'package:proyecto/presentation/using_provider/list_page/change_notifier/change_notifier.dart';

class BookList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookListState();
}

class BookListState extends State<BookList> {

  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     Provider.of<BookChangeNotifier>(context, listen: false).fetchPage();
   });
  }

  @override
  Widget build(BuildContext context) {
    final bookNotifier = Provider.of<BookChangeNotifier>(context);
    final list = bookNotifier.books;

    final status = bookNotifier.status;
    return (status == BookStatus.loading || status == BookStatus.initial)
        ? const LinearProgressIndicator()
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Book book = list[index];
              return Text(book.title!);
            });
  }
}
