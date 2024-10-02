import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/dependency_management/bloc_observer.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/core/utils/dependency_management/service_locator.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo_impl.dart';
// import 'package:route_it27/features/user/data/repo/user_repo_impl.dart';
import 'package:route_it27/route_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheServices.init();
  setupServiceLocator();

  String? token = CacheServices.getData(key: "token");
  Object? widget;
  getIt.get<RoadMapRepoImpl>().fetchSkillTest(testId: 2);
  if (token != null) {
    widget = AppRouter.router.push(AppRouter.kHomeView);
  } else {
    widget = AppRouter.router.push(AppRouter.kLoginView);
  }

  runApp(RouteIT(
    firstView: widget,
  ));
}
