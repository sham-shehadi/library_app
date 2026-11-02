import '../../domain/entities/book.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<Book> books;

  BooksLoaded(this.books);
}

class BooksError extends BooksState {
  final String message;

  BooksError(this.message);
}