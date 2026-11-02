import '../entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();

  Future<void> addBook({
    required String title,
    required int publishedYear,
    required String authorId,
  });
}