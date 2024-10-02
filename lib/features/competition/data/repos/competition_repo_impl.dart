// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, prefer_interpolation_to_compose_strings
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/competition/data/models/add_project_link_model.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/data/models/competitor_models.dart';
import 'package:route_it27/features/competition/data/models/register_competition.dart';
import 'package:route_it27/features/competition/data/models/winners_model.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo.dart';

class CompetitionRepoImpl implements CompetitionRepo {
  ApiService apiService;
  CompetitionRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, List<Competitions>>> fetchCompetitions(
      {required String competitionState}) async {
    try {
      var data = await apiService.get(
          endpoint: "competition/$competitionState",
          bearerToken: CacheServices.getData(key: "token"));
      print(data.toString());
      if (data["status"] == "success") {
        List<dynamic> finalData = data["competitions"];

        List<Competitions> response = finalData
            .map((category) =>
                Competitions.fromJson(category as Map<String, dynamic>))
            .toList();
        // print("heello we got the previous competiotns${response.length}");

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      print("error in previous compettions repository" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, RegisterCompetition>> registerCompetition(
      {required int competitionId}) async {
    try {
      var data = await apiService.post(
          endpoint: "competitor/register",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"competition_id": competitionId});
      final RegisterCompetition response = RegisterCompetition.fromJson(data);
      print(
          "We registered successfully in the competition: ${response.message}");
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        // Handle non-200 status codes here
        if (e.response != null && e.response?.data != null) {
          final RegisterCompetition response =
              RegisterCompetition.fromJson(e.response!.data);
          return Left(ServerFailure(response.message ?? "An error occurred"));
        }
        return Left(ServerFailure(e.message!));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Competitor>>> fetchAllCompetitors(
      {required int competitionId}) async {
    try {
      List<dynamic> data = await apiService.get(
          endpoint: "competitor/competitors",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"competition_id": competitionId});

      List<Competitor> response = data
          .map((competitor) =>
              Competitor.fromJson(competitor as Map<String, dynamic>))
          .toList();

      print(
          "heello we got the competitor name hell yeah${response[0].competitorName}");

      return right(response);
    } catch (e) {
      print("error in fetch competitors  repository" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProjectLinkModel>> addProjectLink(
      {required int competitionId, required String projectLink}) async {
    try {
      Map<String, dynamic> data = await apiService.put(
          endpoint: "competitor/editProjectLink",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {
            "competition_id": competitionId,
            "project_link": projectLink
          });

      ProjectLinkModel response = ProjectLinkModel.fromJson(data);

      print("we addd the project linkkk${response.message}");

      return right(response);
    } catch (e) {
      print("error in add Project Link repository repository" + e.toString());
      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          final ProjectLinkModel response =
              ProjectLinkModel.fromJson(e.response!.data);
          return Left(ServerFailure(response.message ?? "An error occurred"));
        }
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, WinnersModel>> fetchAllWinners(
      {required int competitionId}) async {
    try {
      Map<String, dynamic> data = await apiService.get(
          endpoint: "competitionWinners/get",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {
            "competition_id": competitionId,
          });

      WinnersModel response = WinnersModel.fromJson(data);

      // print("we got the sompettion winners ${response.winners![0].name}");

      return right(response);
    } catch (e) {
      print("error in compettion winnerws repository" + e.toString());
      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          final ProjectLinkModel response =
              ProjectLinkModel.fromJson(e.response!.data);
          return Left(ServerFailure(response.message ?? "An error occurred"));
        }
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
