import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app_task/features/books/domain/usecases/get_book.dart';

import '../../domain/usecases/get_book.dart';
import '../../domain/usecases/add_book.dart';
import 'books_state.dart';

@injectable
class BooksCubit extends Cubit<BooksState> {
  final GetBooksUseCase getBooksUseCase;
  final AddBookUseCase addBookUseCase;

  BooksCubit(
      this.getBooksUseCase,
      this.addBookUseCase,
      ) : super(BooksInitial());

  Future<void> getBooks() async {
    emit(BooksLoading());

    try {
      final books = await getBooksUseCase();
      emit(BooksLoaded(books));
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future<void> addBook({
    required String title,
    required int publishedYear,
    required String authorId,
  }) async {
    emit(BooksLoading());

    try {
      await addBookUseCase(
        title: title,
        publishedYear: publishedYear,
        authorId: authorId,
      );

      await getBooks();
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
}