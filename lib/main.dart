import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app_task/features/authors/data/datasources/author_remote_datasource.dart';
import 'package:library_app_task/features/authors/data/repositoires/authors_repository_impl.dart';
import 'package:library_app_task/features/authors/presentation/author_screen.dart';
import 'package:library_app_task/features/authors/presentation/cubit/authors_cubit.dart';
import 'features/authors/presentation/author_screen.dart';
import 'core/colors.dart';
import 'core/di/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authors/presentation/cubit/authors_cubit.dart';
import 'features/authors/data/repositoires/authors_repository_impl.dart';
import 'features/authors/data/datasources/author_remote_datasource.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
         url: 'https://hrojtqvmfwnbbvzgqsiz.supabase.co',
        anonKey: 'sb_publishable_bvHzgDIYconn6c5XdfOgFw_0uUpxWZT',);
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: BlocProvider(
        create: (_) => getIt<AuthorsCubit>()..getAuthors(),
        child: const AuthorsScreen(),
      ),

      theme: ThemeData(
        scaffoldBackgroundColor: Colorss.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colorss.purple,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colorss.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colorss.pink,
          foregroundColor: Colors.black87,
        ),
      ),

    );
  }
}
