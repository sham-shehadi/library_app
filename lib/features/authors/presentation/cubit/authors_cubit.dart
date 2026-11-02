import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app_task/features/authors/domain/usecases/get_author.dart';

import '../../domain/usecases/add_author.dart';
import '../../domain/usecases/get_author.dart';
import 'authors_state.dart';

@injectable
class AuthorsCubit extends Cubit<AuthorsState> {
  final GetAuthorsUseCase _getAuthorsUseCase;
  final AddAuthorUseCase _addAuthorUseCase;

  AuthorsCubit(
      this._getAuthorsUseCase,
      this._addAuthorUseCase,
      ) : super(AuthorsInitial());

  Future<void> getAuthors() async {
    emit(AuthorsLoading());

    try {
      final authors = await _getAuthorsUseCase();
      emit(AuthorsLoaded(authors));
    } catch (e) {
      emit(AuthorsError(e.toString()));
    }
  }

  Future<void> addAuthor(String name) async {
    try {
      await _addAuthorUseCase(name);
      getAuthors();
    } catch (e) {
      emit(AuthorsError(e.toString()));
    }
  }
}