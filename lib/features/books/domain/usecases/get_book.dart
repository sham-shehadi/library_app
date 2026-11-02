import 'package:injectable/injectable.dart';
import '../entities/book.dart';
import '../repositories/book_ripository.dart';

@injectable
class GetBooksUseCase {
  final BookRepository repository;

  GetBooksUseCase(this.repository);

  Future<List<Book>> call() async {
    return await repository.getBooks();
  }
}