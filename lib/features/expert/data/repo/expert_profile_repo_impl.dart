import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/expert/data/models/expert_profile_model.dart';
import 'package:route_it27/features/expert/data/repo/expert_profile_repo.dart';

class ExpertProfileRepoImpl implements ExpertProfileRepo{
  ApiService apiService;
  ExpertProfileRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, ExpertProfileModel>> fetchExpertProfile(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "getExpertProfile",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {
            "expert_id" : id,
          }
      );

      ExpertProfileModel response = ExpertProfileModel.fromJson(data);
      return (Right(response));

    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}