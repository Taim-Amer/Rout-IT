import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/user/data/models/followed_companies_model.dart';
import 'package:route_it27/features/user/data/models/followed_experts_model.dart';
import 'package:route_it27/features/user/data/models/followed_technologies_model.dart';
import 'package:route_it27/features/user/data/models/my_competitions_model.dart';
import 'package:route_it27/features/user/data/models/my_profile_model.dart';
import 'package:route_it27/features/user/data/models/student_profile_model.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_company_model.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_expert_model.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_technology_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  ApiService apiService;
  UserRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, StudentProfileModel>> fetchStudentProfile(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "getStudentProfile",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {
            "mobile_user_id": id,
          });

      StudentProfileModel response = StudentProfileModel.fromJson(data);

      return (Right(response));
    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FollowedExpertsModel>> showFollowedExperts(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "showFollowedExperts",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"mobile_user_id": id});

      FollowedExpertsModel response = FollowedExpertsModel.fromJson(data);
      print(
          "we got the followed experts ${response.followedExperts![0].email}");

      return (Right(response));
    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FollowedTechnologiesModel>> showFollowedTechnologies(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "showFollowedTechnologies",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"mobile_user_id": id});

      FollowedTechnologiesModel response =
          FollowedTechnologiesModel.fromJson(data);
      print("we got the followed tech nologiew");
      return (Right(response));
    } catch (e) {
      print("we got an error in the followed technologies${e}");
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FollowedCompaniesModel>> showFollowedCompanies(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endpoint: "showFollowedCompanies",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"mobile_user_id": id});

      FollowedCompaniesModel reponse = FollowedCompaniesModel.fromJson(data);

      print("we gor the followed companies");

      return (Right(reponse));
    } catch (e) {
      print("we got an error in the  followin companies ${e.toString()} ");
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ToggleFollowExpertModel>> toggleFollowExpert(
      {required int id}) async {
    try {
      var data = await apiService.post(
          endpoint: "toggleFollowExpert",
          data: {"expert_id": id},
          bearerToken: CacheServices.getData(key: "token"));

      ToggleFollowExpertModel response = ToggleFollowExpertModel.fromJson(data);
      // ignore: avoid_print
      print(" we have followed ${response.message}");

      return (Right(response));
    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ToggleFollowTechnologyModel>> toggleFollowTechnology(
      {required int id}) async {
    try {
      var data = await apiService.post(
          endpoint: "toggleFollowTechnology",
          data: {"technology_id": id},
          bearerToken: CacheServices.getData(key: "token"));

      ToggleFollowTechnologyModel response =
          ToggleFollowTechnologyModel.fromJson(data);
      print(" we have followed the technology${response.message}");

      return (Right(response));
    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ToggleFollowCompanyModel>> toggleFollowCompany(
      {required int id}) async {
    try {
      var data = await apiService.post(
          endpoint: "toggleFollowCompany",
          data: {"company_id": id},
          bearerToken: CacheServices.getData(key: "token"));

      ToggleFollowCompanyModel response =
          ToggleFollowCompanyModel.fromJson(data);
      print(" we jave followed the company ${response.message}");
      return (Right(response));
    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MyProfile>> fetchProfile() async {
    try {
      var data = await apiService.get(
        endpoint: "myProfile",
        bearerToken: CacheServices.getData(key: "token"),
      );

      MyProfile response = MyProfile.fromJson(data);
      // ignore: avoid_print
      print("we got our profile ${response.user!.email}");

      return (Right(response));
    } catch (e) {
      // ignore: avoid_print
      print("errpr in get profile repository");
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MyCompetitionModel>> fetchMyCompetitions() async {
    try {
      var data = await apiService.get(
        endpoint: "competitor/competitions",
        bearerToken: CacheServices.getData(key: "token"),
      );

      MyCompetitionModel response = MyCompetitionModel.fromJson(data);
      // ignore: avoid_print
      print("we got our competiotns ${response.competitions![0].name}");

      return (Right(response));
    } catch (e) {
      // ignore: avoid_print
      print("errpr in get compettions repository");
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
