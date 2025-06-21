import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:book_store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_store_app/features/search/data/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:book_store_app/features/search/data/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<HomeRepoImpl>()),
      child: Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
