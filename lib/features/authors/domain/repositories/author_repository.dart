import '../entities/author.dart';

abstract class AuthorsRepository {
  Future<List<Author>> getAuthors();

  Future<void> addAuthor(String name);
}