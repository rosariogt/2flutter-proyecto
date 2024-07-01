import 'package:get_it/get_it.dart';

import '../data/repositories/book_repository_impl.dart';
import '../data/source/book_remote_data_source.dart';
import '../data/source/network/api.dart';
import '../domain/repository/book_repository.dart';
import '../domain/usecase/get_all_books.dart';


final sl = GetIt.instance;

Future<void>init() async {
  sl.registerLazySingleton<Api>(() => Api());
  sl.registerLazySingleton<BookRemoteDataSourceImpl>(() => BookRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(bookRemoteDataSourceImpl: sl()));
  sl.registerLazySingleton<GetAllBooks>(() => GetAllBooks(repository: sl()));
}
