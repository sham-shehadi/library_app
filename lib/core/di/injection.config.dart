// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:library_app_task/core/di/register_moudle.dart' as _i465;
import 'package:library_app_task/features/authors/data/datasources/author_remote_datasource.dart'
    as _i122;
import 'package:library_app_task/features/authors/data/repositoires/authors_repository_impl.dart'
    as _i559;
import 'package:library_app_task/features/authors/domain/repositories/author_repository.dart'
    as _i277;
import 'package:library_app_task/features/authors/domain/usecases/add_author.dart'
    as _i1030;
import 'package:library_app_task/features/authors/domain/usecases/get_author.dart'
    as _i619;
import 'package:library_app_task/features/authors/presentation/cubit/authors_cubit.dart'
    as _i157;
import 'package:library_app_task/features/books/data/datasources/book_remote_datasource.dart'
    as _i820;
import 'package:library_app_task/features/books/data/repositoires/book_repository_impl.dart'
    as _i24;
import 'package:library_app_task/features/books/domain/repositories/book_ripository.dart'
    as _i732;
import 'package:library_app_task/features/books/domain/usecases/add_book.dart'
    as _i996;
import 'package:library_app_task/features/books/domain/usecases/get_book.dart'
    as _i1037;
import 'package:library_app_task/features/books/presentation/cubit/books_cubit.dart'
    as _i937;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.factory<_i122.AuthorsRemoteDatasource>(
      () => _i122.AuthorsRemoteDatasource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i820.BookRemoteDatasource>(
      () => _i820.BookRemoteDatasource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i732.BookRepository>(
      () => _i24.BookRepositoryImpl(gh<_i820.BookRemoteDatasource>()),
    );
    gh.lazySingleton<_i277.AuthorsRepository>(
      () => _i559.AuthorsRepositoryImpl(gh<_i122.AuthorsRemoteDatasource>()),
    );
    gh.factory<_i996.AddBookUseCase>(
      () => _i996.AddBookUseCase(gh<_i732.BookRepository>()),
    );
    gh.factory<_i1037.GetBooksUseCase>(
      () => _i1037.GetBooksUseCase(gh<_i732.BookRepository>()),
    );
    gh.factory<_i1030.AddAuthorUseCase>(
      () => _i1030.AddAuthorUseCase(gh<_i277.AuthorsRepository>()),
    );
    gh.factory<_i619.GetAuthorsUseCase>(
      () => _i619.GetAuthorsUseCase(gh<_i277.AuthorsRepository>()),
    );
    gh.factory<_i157.AuthorsCubit>(
      () => _i157.AuthorsCubit(
        gh<_i619.GetAuthorsUseCase>(),
        gh<_i1030.AddAuthorUseCase>(),
      ),
    );
    gh.factory<_i937.BooksCubit>(
      () => _i937.BooksCubit(
        gh<_i1037.GetBooksUseCase>(),
        gh<_i996.AddBookUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i465.RegisterModule {}
