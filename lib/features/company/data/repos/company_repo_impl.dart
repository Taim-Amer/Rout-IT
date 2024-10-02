// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/company/data/models/company_profile_model.dart';
import 'package:route_it27/features/company/data/repos/company_repo.dart';

class CompanyRepoImpl implements CompanyRepo {
  final ApiService apiService;

  CompanyRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, CompanyProfileModel>> fetchCompanyProfile(
      {required int companyId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getCompanyProfile",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"company_id": companyId});
      
      CompanyProfileModel response = CompanyProfileModel.fromJson(data);
      print("we got the profile comapny scicndjnf${response.company!.email}");
      return Right(response);
    } catch (e) {
      print("error in company profile repository$e");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
