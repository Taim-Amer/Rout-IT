import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/company/data/repos/company_repo_impl.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo_impl.dart';
import 'package:route_it27/features/expert/data/repo/expert_profile_repo_impl.dart';
import 'package:route_it27/features/home/data/repo/home_repo_impl.dart';
import 'package:route_it27/features/login/data/repos/login_repo_impl.dart';
import 'package:route_it27/features/register/data/repo/register_repo_impl.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo_impl.dart';
import 'package:route_it27/features/search/data/repos/search__repo_impl.dart';
import 'package:route_it27/features/user/data/repo/user_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<CacheServices>(CacheServices());

  getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<RegisterRepoImpl>(
      RegisterRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<RoadMapRepoImpl>(
      RoadMapRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<CompetitionRepoImpl>(
      CompetitionRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<CompanyRepoImpl>(
      CompanyRepoImpl(apiService: getIt.get<ApiService>()));


  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(apiService: getIt.get<ApiService>()));

      
  getIt.registerSingleton<ExpertProfileRepoImpl>(
      ExpertProfileRepoImpl(apiService: getIt.get<ApiService>()));

      getIt.registerSingleton<UserRepoImpl>(
      UserRepoImpl(apiService: getIt.get<ApiService>()));
}
