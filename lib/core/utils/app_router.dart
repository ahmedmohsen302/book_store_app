import 'package:book_store_app/features/home/presentation/views/book_details_view.dart';
import 'package:book_store_app/features/home/presentation/views/home_view.dart';
import 'package:book_store_app/features/search/data/presentation/views/search_view.dart';
import 'package:book_store_app/features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => BookDetailsView(),
      ),
    ],
  );
}
