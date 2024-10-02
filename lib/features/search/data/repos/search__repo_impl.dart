import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/search/data/models/general_search_model.dart';
import 'package:route_it27/features/search/data/models/road_map_search_model.dart';
import 'package:route_it27/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, GeneralSearchModel>> generalSearch(
      {required String name}) async {
    try {
      var data = await apiService.get(
          endpoint: "generalSearch",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"word": name});

      GeneralSearchModel response = GeneralSearchModel.fromJson(data);

      return Right(response);
    } catch (error) {
      // ignore: avoid_print
      print("error in general search repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, RoadMapSearchModel>> roadMapSearch(
      {required String roadMap}) async {
    try {
      var data = await apiService.get(
          endpoint: "roadmapSearch",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"roadmap_name": roadMap});

      RoadMapSearchModel response = RoadMapSearchModel.fromJson(data);
      print("we got the road Maps ${response.roadmaps![0].title}");

      return Right(response);
    } catch (error) {
      // ignore: avoid_print
      print("error in road Map search repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
