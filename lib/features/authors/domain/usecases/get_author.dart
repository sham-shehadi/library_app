import '../entities/author.dart';
import '../repositories/author_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAuthorsUseCase {
  final AuthorsRepository repository;

  GetAuthorsUseCase(this.repository);

  Future<List<Author>> call() async {
    return await repository.getAuthors();
  }
}