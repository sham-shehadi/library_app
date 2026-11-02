import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/authors/domain/repositories/author_repository.dart';
import '../../features/authors/data/repositoires/authors_repository_impl.dart';
import '../../features/books/domain/repositories/book_ripository.dart';
import '../../features/books/data/repositoires/book_repository_impl.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;



}