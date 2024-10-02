import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/features/home/data/models/level_model.dart';
import 'package:route_it27/features/home/data/models/technologies_model.dart';
import 'package:route_it27/features/home/data/models/technology_category_model.dart';
import 'package:route_it27/features/home/data/repo/home_repo.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, List<TechnologyCategoryModel>>>
      fetchAllCategories() async {
    try {
      var data = await apiService.get(
          endpoint: "getTechnologyCategories",
          bearerToken: CacheServices.getData(key: "token"));
      if (data["message"] == "Success") {
        List<dynamic> finalData = data["data"];

        List<TechnologyCategoryModel> response = finalData
            .map((category) => TechnologyCategoryModel.fromJson(category))
            .toList();
        print(response[0].image);

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("error in get categories technologies" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TechnologiesModel>>> fetchTechnologies(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "getTechnologies",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"technology_category_id": id});
      print(data.toString());

      if (data["message"] == "Success") {
        List<dynamic> finalData = data["data"];
        List<TechnologiesModel> response = finalData
            .map((technology) => TechnologiesModel.fromJson(technology))
            .toList();

        return right(response);
      } else {
        throw (ServerFailure(data["message"]));
      }
    } catch (error) {
      // ignore: avoid_print
      print("error in technologies repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<LevelModel>>> fetchLevels(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "getTechnologyLevels",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"technology_id": id});
      if (data["message"] == "Success") {
        List<dynamic> finalData = data["levels"];
        List<LevelModel> response =
            finalData.map((level) => LevelModel.fromJson(level)).toList();
        return right(response);
      } else {
        throw (ServerFailure(data["message"]));
      }
    } catch (error) {
      // ignore: avoid_print
      print("error in levels repository  $error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
