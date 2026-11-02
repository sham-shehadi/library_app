import '../../domain/entities/book.dart';
import '../../domain/repositories/book_ripository.dart';
import '../datasources/book_remote_datasource.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final BookRemoteDatasource remoteDatasource;

  BookRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Book>> getBooks() {
    return remoteDatasource.getBooks();
  }

  @override
  Future<void> addBook({
    required String title,
    required int publishedYear,
    required String authorId,
  }) {
    return remoteDatasource.addBook(
      title: title,
      publishedYear: publishedYear,
      authorId: authorId,
    );
  }
}