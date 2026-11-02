import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

import '../model/author_model.dart';

@injectable
class AuthorsRemoteDatasource {
  final SupabaseClient client;

  AuthorsRemoteDatasource(this.client);

  Future<List<AuthorModel>> getAuthors() async {
    final data = await client.from('authors').select();

    return data.map((json) => AuthorModel.fromJson(json)).toList();
  }

  Future<void> addAuthor(String name) async {
    await client.from('authors').insert({'name': name,});
  }
}