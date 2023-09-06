import 'package:bookly/Features/Home/data/Repos/Home_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'Api_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio(),),);
  getIt.registerSingleton<HomeRepoImplementaion>(
    HomeRepoImplementaion(
     getIt.get<ApiService>()
    ),
  );
  
}


