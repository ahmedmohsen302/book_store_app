import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:book_store_app/features/home/data/models/book_model/item.dart';
import 'package:book_store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_store_app/features/home/presentation/view_models/similar_books/similar_books_cubit.dart';
import 'package:book_store_app/features/home/presentation/views/book_details_view.dart';
import 'package:book_store_app/features/home/presentation/views/home_view.dart';
import 'package:book_store_app/features/search/data/presentation/views/search_view.dart';
import 'package:book_store_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(path: searchView, builder: (context, state) => SearchView()),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(book: state.extra as Item),
        ),
      ),
    ],
  );
}
