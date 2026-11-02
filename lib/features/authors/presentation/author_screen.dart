import 'package:flutter/material.dart';
import 'widget/add_authors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/authors_cubit.dart';
import 'cubit/authors_state.dart';
import '../../books/presentation/books_screen.dart';
import '../../books/presentation/cubit/books_cubit.dart';
import '../../books/data/repositoires/book_repository_impl.dart';
import '../../books/data/datasources/book_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/di/injection.dart';
class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('المؤلفون'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_book), tooltip: 'الكتب',
            onPressed: () {
              final state = context.read<AuthorsCubit>().state;
              if (state is! AuthorsLoaded) return;
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => getIt<BooksCubit>()..getBooks(),
                    child: BooksScreen(authors: state.authors),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<AuthorsCubit, AuthorsState>(
        builder: (context, state) {
          if (state is AuthorsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthorsError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is AuthorsLoaded) {
            if (state.authors.isEmpty) {
              return  Center(
                child: Text('لا يوجد مؤلفون بعد'),
              );
            }

            return ListView.builder(
              padding:  EdgeInsets.only(top: 20, bottom: 100),
              itemCount: state.authors.length,
              itemBuilder: (context, index) {final author = state.authors[index];

                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  elevation: 0,
                  color:  Color(0xFFFFFBF7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                      color: Color(0xFFE5D8D0),
                    ),
                  ),
                  child: Padding(padding:EdgeInsets.all(20),
                    child: Row(textDirection: TextDirection.rtl,
                      children: [
                         CircleAvatar(radius: 26,
                          backgroundColor: Color(0xFF5E2A2B), child: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            author.name,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5E2A2B),
                            ),
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor:  Color(0xFF5E2A2B),
        foregroundColor: Colors.white, icon:  Icon(Icons.add),
        label: Text('إضافة مؤلف'),
        onPressed: () async {
          final name = await showModalBottomSheet<String>(
            context: context,
            isScrollControlled: true,
            constraints:  BoxConstraints(
              maxWidth: double.infinity,
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child:  AddAuthor(),
              );
            },
          );

          if (!context.mounted || name == null) return;
          await context.read<AuthorsCubit>().addAuthor(name);



        },
      ),
    );
  }
}