import 'package:injectable/injectable.dart';
import '../repositories/book_ripository.dart';

@injectable
class AddBookUseCase {
  final BookRepository repository;

  AddBookUseCase(this.repository);

  Future<void> call({
    required String title, required int publishedYear, required String authorId,}) async {
    return await repository.addBook(
      title: title,
      publishedYear: publishedYear,
      authorId: authorId,
    );
  }
}