import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/books_cubit.dart';
import 'cubit/books_state.dart';
import '../../authors/domain/entities/author.dart';
import 'widgets/add_book.dart';

class BooksScreen extends StatelessWidget {
  final List<Author> authors;

  const BooksScreen({
    super.key,
    required this.authors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF5F3EF),
      appBar: AppBar(
        title:  Text('الكتب'),),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF5E2A2B), foregroundColor: Colors.white, icon: Icon(Icons.add), label: const Text('إضافة كتاب'),
    onPressed: () async {
    final book = await showModalBottomSheet<
    ({String title, int publishedYear, String authorId})>(
    context: context, isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: double.infinity,),
    builder: (context) => Padding(
    padding: EdgeInsets.only(
    bottom: MediaQuery.of(context).viewInsets.bottom,),
    child: AddBook(authors: authors),),
    );

    if (!context.mounted || book == null) return;

    await context.read<BooksCubit>().addBook(
    title: book.title,
    publishedYear: book.publishedYear,
    authorId: book.authorId,
    );
    },
    ),
      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state is BooksLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BooksError) {
            return Center(child: Text(state.message));
          }

          if (state is BooksLoaded) {
            if (state.books.isEmpty) {
              return Center(
                child: Text('لا يوجد كتب بعد'),);
            }

            return ListView.builder(
              padding:  EdgeInsets.only(top: 20, bottom: 100),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];

                return
                   Card(
                  margin:EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  elevation: 0,
                  color: Color(0xFFFFFBF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                      color: Color(0xFFE5D8D0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(width: 64, height: 80, decoration: BoxDecoration(
                            color:Color(0xFF5E2A2B),
                            borderRadius: BorderRadius.circular(12),),
                          child: Icon(Icons.menu_book_rounded, color: Colors.white, size: 32,),),
                        SizedBox(width: 18),
                        Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                              Text(book.title, textAlign: TextAlign.right, style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                  color: Color(0xFF5E2A2B),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'المؤلف: ${book.authorName ?? "غير محدد"}',
                                textDirection: TextDirection.rtl,
                              ),
                               SizedBox(height: 6),
                              Text(
                                'سنة النشر: ${book.publishedYear ?? "غير محددة"}',
                                textDirection: TextDirection.rtl,
                                style:  TextStyle(color: Color(0xFF78665E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return  SizedBox.shrink();
        },
      ),
    );
  }
}