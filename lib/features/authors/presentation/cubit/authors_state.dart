import '../../domain/entities/author.dart';

abstract class AuthorsState {}

class AuthorsInitial extends AuthorsState {}

class AuthorsLoading extends AuthorsState {}

class AuthorsLoaded extends AuthorsState {
  final List<Author> authors;

  AuthorsLoaded(this.authors);
}

class AuthorsError extends AuthorsState {
  final String message;

  AuthorsError(this.message);
}