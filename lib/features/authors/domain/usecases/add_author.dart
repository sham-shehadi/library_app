import '../repositories/author_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddAuthorUseCase {
  final AuthorsRepository repository;

  AddAuthorUseCase(this.repository);

  Future<void> call(String name) async {
    return await repository.addAuthor(name);
  }
}