import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/book_model.dart';
import '../model/book_model.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class BookRemoteDatasource {
  final SupabaseClient client;

  BookRemoteDatasource(this.client);

  Future<List<BookModel>> getBooks() async {
    final data = await client
        .from('books')
        .select('*, authors(name)');

    return data.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<void> addBook({
    required String title,
    required int publishedYear,
    required String authorId,
  }) async {
    await client.from('books').insert({
      'title': title,
      'published_year': publishedYear,
      'author_id': authorId,
    });
  }
}