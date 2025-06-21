import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_store_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'package:book_store_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_store_app/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const BookStorApp());
}

class BookStorApp extends StatelessWidget {
  const BookStorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
