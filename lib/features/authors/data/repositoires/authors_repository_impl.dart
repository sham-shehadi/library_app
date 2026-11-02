import 'package:library_app_task/features/authors/data/datasources/author_remote_datasource.dart';
import 'package:library_app_task/features/authors/domain/repositories/author_repository.dart';

import '../../domain/entities/author.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: AuthorsRepository)
class AuthorsRepositoryImpl implements AuthorsRepository {
  final AuthorsRemoteDatasource remoteDatasource;

  AuthorsRepositoryImpl(this.remoteDatasource);

  @override
  Future<void> addAuthor(String name) => remoteDatasource.addAuthor(name);

  @override
  Future<List<Author>> getAuthors() => remoteDatasource.getAuthors();
}