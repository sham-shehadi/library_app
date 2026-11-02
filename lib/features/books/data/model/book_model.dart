import '../../domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    super.publishedYear,
    super.authorId,
    super.authorName,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final author = json['authors'] as Map<String, dynamic>?;

    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      publishedYear: json['published_year'] as int?,
      authorId: json['author_id'] as String?,
      authorName: author?['name'] as String?,
    );
  }
}