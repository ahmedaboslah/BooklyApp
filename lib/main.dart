import 'package:bookly/Features/Home/Presentation/Manager/Newset/cubit/new_set_books_cubit.dart';
import 'package:bookly/Features/Home/Presentation/Manager/Seacrh_Cubit/cubit/search_book_cubit.dart';
import 'package:bookly/Features/Home/Presentation/Manager/cubit/featured_book_cubit_cubit.dart';
import 'package:bookly/Features/Home/data/Repos/Home_repo.dart';
import 'package:bookly/Features/Home/data/Repos/Home_repo_implement.dart';
import 'package:bookly/core/Util/Api_services.dart';
import 'package:bookly/core/Util/App_router.dart';
import 'package:bookly/core/Util/Servece_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constants.dart';
import 'Features/Views/Splash_view.dart';

void main() {
  setup();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubitCubit(
            getIt.get<HomeRepoImplementaion>()
          )..fetchFeaturedBooks(),
          
        ),
         BlocProvider(
          create: (context) => NewSetBooksCubit(
            getIt.get<HomeRepoImplementaion>()
          )..fetchNewSetBooks(),
          
        ),
        BlocProvider(
          create: (context) => SearchBookCubit(
            getIt.get<HomeRepoImplementaion>()
          )..fetchSearch(),
          
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: KprimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
