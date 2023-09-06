import 'package:bookly/Features/Home/Presentation/Manager/Similar_book_cubi/cubit/similar_book_cubit.dart';
import 'package:bookly/Features/Home/data/Repos/Home_repo_implement.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Features/Search/Presentation/Views/Search_view.dart';
import 'package:bookly/core/Util/Servece_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Home/Presentation/View/Book_details_view.dart';
import '../../Features/Home/Presentation/View/Home.dart';
import '../../Features/Views/Splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splashview(),
      ),
      GoRoute(
        path: '/Home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/Book_details_view',
        builder: (context, state) =>  BlocProvider(
          create: (context) => SimilarBookCubit(getIt.get<HomeRepoImplementaion>()),
          child: BookDetailsView(bookmodel: state.extra as BookModel,),
        ),
      ),
      GoRoute(
        path: '/Search_view',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
