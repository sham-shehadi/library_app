class Book {
  final String id;
  final String title;
  final int? publishedYear;
  final String? authorId;
  final String? authorName;

  const Book({
    required this.id,
    required this.title,
    this.publishedYear,
    this.authorId,
    this.authorName,
  });
}